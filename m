From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH v2 2/3] fpga manager: framework core
Date: Fri, 24 Oct 2014 13:55:10 +0300
Message-ID: <B914D894-E486-4EF1-8F84-169E939C58B4@konsulko.com>
References: <1414007405-32186-1-git-send-email-atull@opensource.altera.com> <1414007405-32186-3-git-send-email-atull@opensource.altera.com> <20141024105200.GA20775@amd>
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20141024105200.GA20775@amd>
Sender: linux-doc-owner@vger.kernel.org
To: Pavel Machek <pavel@denx.de>
Cc: atull@opensource.altera.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, jgunthorpe@obsidianresearch.com, hpa@zytor.com, Michal Simek <monstr@monstr.eu>, michal.simek@xilinx.com, rdunlap@infradead.org, linux-kernel <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, robh+dt@kernel.org, Grant Likely <grant.likely@linaro.org>, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, Mark Brown <broonie@kernel.org>, philip@balister.org, rubini@gnudd.com, Steffen Trumtrar <s.trumtrar@pengutronix.de>, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, Felipe Balbi <balbi@ti.com>, m.chehab@samsung.com, davidb@codeaurora.org, Rob Landley <rob@landley.net>, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, Linus Walleij <linus.walleij@linaro.org>, Alan Tull <delicious.quinoa@gmail.com>, dinguyen@opensource.altera.com, yvand
List-Id: devicetree@vger.kernel.org

Hi Pavel,

> On Oct 24, 2014, at 1:52 PM, Pavel Machek <pavel@denx.de> wrote:
>=20
> Hi!
>=20
>> * /sys/class/fpga_manager/<fpga>/firmware
>>  Name of FPGA image file to load using firmware class.
>>  $ echo image.rbf > /sys/class/fpga_manager/<fpga>/firmware
>=20
> I .. still don't think this is good idea. What about namespaces?
> The path corresponds to path in which namespace?
>=20

=46WIW the overlays patchset uses binary configfs attribute to make thi=
s work.

>> +int fpga_mgr_write(struct fpga_manager *mgr, const char *buf, size_=
t count)
>> +{
>> +	int ret;
>> +
>> +	if (test_and_set_bit_lock(FPGA_MGR_BUSY, &mgr->flags))
>> +		return -EBUSY;
>> +
>> +	dev_info(mgr->dev, "writing buffer to %s\n", mgr->name);
>> +
>> +	ret =3D __fpga_mgr_write(mgr, buf, count);
>> +	clear_bit_unlock(FPGA_MGR_BUSY, &mgr->flags);
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(fpga_mgr_write);
>=20
> Is the EBUSY -- userspace please try again, but you don't know when t=
o
> try again -- right interface? I mean, normally kernel would wait, so
> that userland does not have to poll?
>=20
>> +static ssize_t fpga_mgr_firmware_store(struct device *dev,
>> +				       struct device_attribute *attr,
>> +				       const char *buf, size_t count)
>> +{
>> +	struct fpga_manager *mgr =3D dev_get_drvdata(dev);
>> +	unsigned int len;
>> +	char image_name[NAME_MAX];
>> +	int ret;
>> +
>> +	/* lose terminating \n */
>> +	strcpy(image_name, buf);
>> +	len =3D strlen(image_name);
>> +	if (image_name[len - 1] =3D=3D '\n')
>> +		image_name[len - 1] =3D 0;
>> +
>> +	ret =3D fpga_mgr_firmware_write(mgr, image_name);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return count;
>> +}
>=20
> This shows why the interface is not right... Valid filename may
> contain \n, right? It may even end with \n.
>=20

I could argue that a valid firmware file is one that=E2=80=99s well for=
med and does not
contain those characters.

I guess this is only for make echo file >foo work. You could specify th=
at echo -n file >foo is
required.


> Best regards,
> 									Pavel
> --=20
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/hors=
es/blog.html

Regards

=E2=80=94 Pantelis

