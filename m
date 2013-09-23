From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/5] mfd: arizona: Add micdet ranges and polarity device
 tree bindings
Date: Mon, 23 Sep 2013 23:25:03 +0100
Message-ID: <20130923222503.GJ21013@sirena.org.uk>
References: <1379961043-23762-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1379961043-23762-4-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vRyMahX6VF+pdQvX"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1379961043-23762-4-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--vRyMahX6VF+pdQvX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 23, 2013 at 07:30:42PM +0100, Charles Keepax wrote:

>  Documentation/devicetree/bindings/mfd/arizona.txt |   26 +++++
>  drivers/mfd/arizona-core.c                        |  116 +++++++++++++++++++++

It's probably more idomatic to put the parsing for these in the driver
that uses them.

> +  - wlf,micd-ranges : Microphone detection level and key configuration, this
> +    field can be of variable length but should always be a multiple of 2 cells
> +    long, each two cell group represents one button configuration
> +    The first cell is the maximum impedance for this button in ohms
> +    The second cell the key that should be reported to the input layer

This isn't good - the device tree is supposed to be an OS independant
description of the hardware that can be used by any OS but this binding
embeds Linux-specific numbers.  There are a few Linux specific bindings
where people have just given up due to the complexity of developing a
generic description but this doesn't seem like it shuld be such a case.
This is going to be used for buttons on headsets and essentially all
real headsets can be covered by just defining the ability to set hook
switch, fast forward and rewind.

--vRyMahX6VF+pdQvX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSQL+8AAoJELSic+t+oim9RfQP/j8AnrLP6kju7ZsIjY0EvJcq
EunDlnJtQXycXeebsB2zAjVUqqmeCj2a44BEyuTVE5YJn+pzyS5C7MlQHkXDS/7N
mADOjzBYmE/tQuxZkZwU7D1KsYEGY6QJVE08Pbbbg6oyx3sBmbGqRLYOH5WdDgde
VP0G5MprrGRc9GtAeVBD0kz3hg+Yjh5F1wHyDHaxYyYDy+jL6m8axIOD9ay1Nz+i
6yYA2AmiLH8nNy5khOeJbcPHaSFMxyYnORHDJB1AU6WIl5beKDwogStW3tifTZgV
cQ1jZc3G9hm6DHN2/0xga+3br2xBYYavhLgh2QUzmNSQkqZjfcvMJOkFGP3JfNmh
qpW8Sz5sbQZ84iQ59nQQGiG3EDxK39cP3nmrtKdZpBYPY6vUO9oBbg1SVC+BrY3t
nvxc5+ciVnaKZGFqopLWw/Ls/Dd/p4m+OuOHejZuLgYzcZ4DaHlM+xWAcwcMLfuf
W2chRvQ8+iW1aWuPmJSx1ANIKVyyasoCLI68Nj2E0A2vSCuJL0CCP/5yitzdwxAJ
2EW5BfsmOiP9LpsZPTgnTVZvJjCAYxSa29ePvgy6SPZOGmc0sAsAxirYOfmnQQug
792orAMCfX76PYahcW6JHYB2JFajTrukLNVPXk9kjgsmfhHjFPzFkHLomha5uwSA
EcsiY7IUCYMh0aXpEEiz
=eXDG
-----END PGP SIGNATURE-----

--vRyMahX6VF+pdQvX--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
