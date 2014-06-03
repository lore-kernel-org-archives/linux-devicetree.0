From: Ivaylo Dimitrov <ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of/base: Replace alias if it already exists
Date: Tue, 03 Jun 2014 12:58:26 +0300
Message-ID: <538D9C42.9040707@gmail.com>
References: <1401624083-30796-1-git-send-email-ivo.g.dimitrov.75@gmail.com>	<20140602145959.7E669C426F6@trevor.secretlab.ca>	<538CA125.7090906@gmail.com> <20140603085325.490A1C4096E@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140603085325.490A1C4096E-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On  3.06.2014 11:53, Grant Likely wrote:

> So, if I understand correctly, the .dtsi file sets up aliases like so:
>
> aliases {
> 	i2c0 = &i2c1;
> 	i2c1 = &i2c2;
> 	i2c2 = &i2c3;
> 	i2c3 = &i2c4;
> 	i2c4 = &i2c5;
> };
>
> and the board file does this:
>
>
> aliases {
> 	i2c1 = &i2c1;
> 	i2c2 = &i2c2;
> 	i2c3 = &i2c3;
> 	i2c4 = &i2c4;
> 	i2c5 = &i2c5;
> };
>
> Which results in a dtb that looks like this:
>
> aliases {
> 	i2c0 = &i2c1;
> 	i2c1 = &i2c1;
> 	i2c2 = &i2c2;
> 	i2c3 = &i2c3;
> 	i2c4 = &i2c4;
> 	i2c5 = &i2c5;
> };
>
> Do I understand correctly?
>

I guess this is the resulting dtb, at least kernel assigns "incorrect" 
index(0) only to i2c1 bus.

> The way aliases works, it is completely valid to have multiple aliases
> pointing at the same node. There are also no ordering guarantees about
> which comes first, so though this patch might work for you at the
> moment, there is no guarantee that it will continue to do so. If the
> i2c0 alias is invalid for that platform, then it must be removed.
>

I see.

> Unfortunately, the overlays have no mechanism for removing properties at
> this time. Can you try putting the following into your board dts file
> and see if it works?
>
> aliases {
> 	i2c0;		/* Deactivate the old alias by making it blank */
> 	i2c1 = &i2c1;
> 	i2c2 = &i2c2;
> 	i2c3 = &i2c3;
> 	i2c4 = &i2c4;
> 	i2c5 = &i2c5;
> };
>
> g.
>

Will do, as soon as I get back home.

Thanks,
Ivo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
