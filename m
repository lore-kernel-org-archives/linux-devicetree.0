From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/2] hwmon: (lm70) Utilize dev_warn instead of pr_warn
Date: Sun, 22 Jan 2017 22:56:34 -0800
Message-ID: <1485154594.12563.27.camel@perches.com>
References: <20170121192010.30681-1-f.fainelli@gmail.com>
         <20170121192010.30681-2-f.fainelli@gmail.com>
         <1485153837.12563.23.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1485153837.12563.23.camel-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:HARDWARE MONITORING" <linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:DOCUMENTATION" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, 2017-01-22 at 22:43 -0800, Joe Perches wrote:
> Two questions for Julia Lawall:
> 
> o is there a better way to do this than repeat the blocks
>   one for each replacement
> o can struct device * dev be made an arbitrary identifier
> 
> $ cat dev_printk.cocci
> @@
> identifier fn;
> type T;
> @@
> 
> T fn ( ..., struct device * dev, ... ) {
> <...
> -	pr_emerg(
> +	dev_emerg(dev,
> 	...);
> ...>
> }

Well, the second question is simple if I would just
think a little before asking...

@@
identifier fn;
identifier dev;
type T;
@@

T fn ( ..., struct device * dev, ... ) {
<...
-	pr_emerg(
+	dev_emerg(dev,
	...);
...>
}

etc...

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
