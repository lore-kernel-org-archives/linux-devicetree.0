From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 2/3 v4] ARM: bcm2835: Add the Raspberry Pi firmware driver
Date: Thu, 28 May 2015 15:36:36 -0700
Message-ID: <87twuw72iz.fsf@eliezer.anholt.net>
References: <20150528114500.GP11677@x1> <1432837987-22861-1-git-send-email-eric@anholt.net> <5567886F.5080108@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5567886F.5080108@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Stephen Warren <swarren@wwwdotorg.org> writes:

> On 05/28/2015 12:33 PM, Eric Anholt wrote:
>> This gives us a function for making mailbox property channel requests
>> of the firmware, which is most notable in that it will let us get and
>> set clock rates.
>
> This thread was rather hard to follow since updated versions of patches
> were sent "in response" to the original posting rather than as a new
> thread. Generally it's best to post a complete copy of each new version
> of the series, and as a completely standalone thread.

Will do.

>> diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
>
>> +obj-$(CONFIG_BCM2835_MBOX)	+= raspberrypi.o
>
> I think this warrants its own Kconfig option that depends on _MBOX.

Done, called it RASPBERRPI_FIRMWARE

>> diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
>
>> +int rpi_firmware_property_list(struct device_node *of_node,
>> +			       void *data, size_t tag_size)
>> +{
>> +	struct platform_device *pdev = of_find_device_by_node(of_node);
>
> I would expect the of_node -> pdev mapping to happen at client device
> probe time. Simplest for this driver would be if the
> client-probe-time-mapping function returned the "struct rpi_firmware"
> and the client passed that to this function.

Done.

>> +	struct rpi_firmware *fw = platform_get_drvdata(pdev);
>> +	size_t size = tag_size + 12;
>> +	u32 *buf;
>> +	dma_addr_t bus_addr;
>> +	int ret;
>> +
>> +	if (!fw)
>> +		return -EPROBE_DEFER;
>
> That return code should only be used in functions called at probe time.
> While I do see the expectation is that clients call this function once
> at probe time and hence guarantee to see -EPROBE_DEFER at probe time (if
> at all), it's rather odd for a function that's intended to be called at
> times other that probe() to ever have the possibility of returning
> -EPROBE_DEFER. If somehow that values gets returned at another time,
> it's going to be rather confusing to the client.

Dropped now that I'm passing fw in.

>> +	buf[0] = size;
>> +	buf[1] = RPI_FIRMWARE_STATUS_REQUEST;
>> +	memcpy(&buf[2], data, tag_size);
>> +	buf[size / 4 - 1] = RPI_FIRMWARE_PROPERTY_END;
>
> Out of curiosity, why not require the client to format the entire
> message itself? In theory at least, the client could submit a whole
> "string" of tags at once, so it really seems like the client should be
> constructing the whole message.

Because it's something extra for the client to screw up?  I mean, if we
were going for super high performance, we'd have the client asking us
for a DMA buffer to write into, and they'd write the whole thing, and
submit that back to us.  But we don't need that, because the property
channel is used so rarely.

I briefly used multi-tag in a not-for-upstream KMS-using-the-firmware
branch, but it turned out the FB MBOX channel was strictly better (once
I worked around a fw bug).

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVZ5h0AAoJELXWKTbR/J7oY7gQALygxS5WxZjfL2/U7xj78bdn
51C5xWQkDkkHkfY/h39+JCHIcJoMGNMqCCwsLs/NfCxx8LkDrKe+0bnSRPXLN2lS
4bgXADSZYulLkbGjwuxMy+LZ7E4OLwhQPY72R3FRYq+of5H+rEks03UN7j8zUlD1
L8ifalRKXscF3Gue6PXq6Q/5NwDaAIc7O9WJkPSx7uNUHSGndL4rDcGG3fRZjyo+
816VD1NjLwd5EM3qoXYYWTsoDS/WF1bmSfpC+DpP1GUqhNvVNvk7fVU5U4PnjU0N
EL8bFIqZarKOUmxeIto8jTACdhdl/6cQggoUhcKe4rWdDSb1Vqd6UUih8eB/wc89
cOzG24eaNO5DrbARxE/5jMPZ0TscATSgBWJAiLOGKG3jrkQaivNiV9u9JnvwUsWv
WpraDj0bjctKEXK5XjUBRt0jqegUriFIhrJJ6/vwbyn5wUj+JDRLNEKIyZ6OqNNv
UvJi0hIzx6DW4U2BGGwfGreC5+mUelZKVdtIuKPXjiofBXyAW8aF0VlTWuZVqQkO
tuTOp6fTvGw/BahLKTZqFrDDtBRm29SYYef0A7JFdCf7kEW2kBSGujY6QDRFOlzq
nZrJkSdxHw/tGaBGvi/uHTCc3DiRZaefV3tdycfxY33/+u0F38eWOEoJqeuvmZZ0
e9flvxdTUwjgM8oFISfO
=cwzm
-----END PGP SIGNATURE-----
--=-=-=--
