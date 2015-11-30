From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: dt: mvebu: ix4-300d: Add ECC properties to NAND flash
Date: Mon, 30 Nov 2015 15:22:02 +0100
Message-ID: <87a8pv5zzp.fsf@free-electrons.com>
References: <1448709248-21177-1-git-send-email-sebastian.hesselbarth@gmail.com>
	<1448709248-21177-5-git-send-email-sebastian.hesselbarth@gmail.com>
	<20151129153548.304522af@free-electrons.com>
	<565C090D.4060006@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <565C090D.4060006-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> (Sebastian Hesselbarth's message of
	"Mon, 30 Nov 2015 09:30:05 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Benoit Masson <yahoo-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sebastian,
 
 On lun., nov. 30 2015, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> On 29.11.2015 15:35, Thomas Petazzoni wrote:
>> Adding Ezequiel Garcia in Cc.
>>
>> On Sat, 28 Nov 2015 12:14:08 +0100, Sebastian Hesselbarth wrote:
>>> The NAND device found on Lenovo ix4-300d uses 4-bit BCH ECC protection.
>>> Add the corresponding properties to the NAND node.
>>
>> If the ONFI information from the NAND flash say that it requires 4 bits
>> per 512, then there should be no need to add this information to the
>> Device Tree as the pxa3xx_nand driver by default uses the ONFI
>> information.
>
> Thomas,
>
> as said in the cover letter, this is also DT cleanup with barebox
> bootloader in mind. I do not accept what Linux' pxa3xx_nand driver
> is doing as a reference here ;)
>
>> Those properties are only needed when for some reason the vendor has
>> chosen to use a ECC strength that doesn't match with the one advertised
>> by the flash in its ONFI information (either stronger or weaker). But
>> in this case, your commit log is confusing, because it says that the
>> "NAND device ... uses 4-bit BCH ECC protection". If it really does,
>> then the patch is not needed :-)
>
> I agree that if ONFI is already advertising 4/512 ECC (and it is), we
> do not need the properties. Anyway, IIRC barebox does not yet properly
> parse ONFI or at least it does not derive minimum ECC settings from it.
>
> I'll have to have a closer look at barebox' ONFI parsing capabilites
> and can live with this patch not applied even though it does no harm.

So for now, I don't apply it.

Thanks,

Gregory

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
