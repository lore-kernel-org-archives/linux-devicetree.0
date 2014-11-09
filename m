From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 1/2] of: Make const the device node pointers in
 of_clk_get and of_node_put
Date: Sun, 9 Nov 2014 18:50:19 +0000
Message-ID: <20141109185019.GU4042@n2100.arm.linux.org.uk>
References: <cover.1415557680.git.moinejf@free.fr>
 <375a82230accf26dfbbb74e6f928243ea8e38b50.1415557680.git.moinejf@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <375a82230accf26dfbbb74e6f928243ea8e38b50.1415557680.git.moinejf-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Nov 08, 2014 at 07:33:22PM +0100, Jean-Francois Moine wrote:
> Some device nodes are sometimes referenced by const pointers.
> 
> This patch avoids to cast these pointers when calling the functions
> of_clk_get() and of_node_put().

NAK.  Firstly, of_node_put contains a kref, which is /definitely/ not
a const item when kobject_put() is called on it.  Inside the kobject
is a kref, which kobject_put() will call kref_put() on.  kref_put()
in turn will internally call atomic_sub_and_test() on a value embedded
within the kref struct.

Ergo, of_node_put() modifies the struct device_node contents.  Therefore,
of_node_put() definitely not treating the data pointed to as read-only,
and therefore it is completely inappropriate for it to be marked "const".

What this then means is that it fundamentally undermines the idea of
storing the pointer to a device_node as a const pointer, as the device
node must always be modified when you're done with it (because it's a
ref-counted structure.)  So, having it const in your code is a bug.

What this also means is that every other place that you've added const
below is also very dubious.

-- 
FTTC broadband for 0.8mile line: currently at 9.5Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
