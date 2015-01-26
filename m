From: "christophe.ricard" <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 0/4] st33zp24 new architecture proposal and st33zp24
 spi driver
Date: Mon, 26 Jan 2015 23:11:48 +0100
Message-ID: <54C6BBA4.1010208@gmail.com>
References: <1422220293-21005-1-git-send-email-christophe-h.ricard@st.com> <201501262239.25303.PeterHuewe@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201501262239.25303.PeterHuewe-Mmb7MZpHnFY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-15?Q?Peter_H=FCwe?= <PeterHuewe-Mmb7MZpHnFY@public.gmane.org>
Cc: ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, benoit.houyere-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, jarkko.sakkinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Peter,

Thanks for your time.
I think it will be fine to wait for kernel 3.21.

Best Regards
Christophe
On 26/01/2015 22:39, Peter H=FCwe wrote:
> Hi Christophe,
>
> Am Sonntag, 25. Januar 2015, 22:11:29 schrieb Christophe Ricard:
>> Hi,
>>
>> The following patchset:
>> - propose a new architecture allowing to share a core st33zp24 data
>> management layer with different phy (i2c & spi). For st33zp24 both p=
hy
>> have a proprietary transport protocol. Both are relying on the TCG T=
IS
>> protocol. At the end, it simplifies the maintenance. - Add an spi ph=
y
>> allowing to support st33zp24 using with an SPI bus.
>>
>> The complete solution got tested in polling and interrupt mode succe=
ssfully
>> with i2c & spi phy. This patchset applies on top of Peter's tree
>> https://github.com/PeterHuewe/linux-tpmdd.git for-james branch on to=
p of:
>> d4989d9f693b9502f9288da5db279c2f8c2e50be tpm/tpm_tis: Add missing if=
def
>> CONFIG_ACPI for pnp_acpi_device
>>
>> I confirm also Jarkko Sakkinen's changes are working with this produ=
ct with
>> both phy's.
>>
>> - v2 takes into account feedbacks from Jason Gunthorpe.
>> - v3 is reduced to 4 patches as 6 out of 10 got accepted for 3.20. A=
lso
>> compare to v2: * Fix build issue with patch v2 04/10 "Replace access=
 to
>> io_lpcpd from struct st33zp24_platform_data to tpm_stm_dev" * Fix li=
nk
>> issue with patch v2 08/10 "Split tpm_i2c_tpm_st33 in 2 layers (core =
+
>> phy)" when building as a module. The symbols wasn't exported in
>> st33zp24.c.
>>          * Add missing MODULE_LICENSE in patch v2 09/10 "Add st33zp2=
4 spi
>> phy" * Fix node example in dts spi documentation in patch v2 10/10 "=
Add
>> dts documentation for st33zp24 spi phy" * Fix typo on Jason Gunthorp=
e
>> first name. Sorry for that :(... * Change contact email address as
>> tpmsupport-qxv4g6HH51o@public.gmane.org is no more valid - v4 adds missing module_license =
in
>> st33zp24
> I'll review the stuff (since I cannot test :) during the next few day=
s.
> Meanwhile I added to my 'staging tree'
> https://github.com/PeterHuewe/linux-tpmdd/tree/testing-and-review
>
> I doubt that James will accept it for 3.20.
>
> Thanks,
> Peter

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
