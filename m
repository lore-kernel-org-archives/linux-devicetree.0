From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 01/10] of_net: add NVMEM support to of_get_mac_address
Date: Fri, 3 May 2019 14:05:09 +0200
Message-ID: <20190503120509.GA1941@lunn.ch>
References: <1556870168-26864-1-git-send-email-ynezz@true.cz>
 <1556870168-26864-2-git-send-email-ynezz@true.cz>
 <2a5fcdec-c661-6dc5-6741-7d6675457b9b@cogentembedded.com>
 <20190503091542.GE346@meh.true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190503091542.GE346@meh.true.cz>
Sender: netdev-owner@vger.kernel.org
To: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Alban Bedel <albeu@free.fr>, Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, May 03, 2019 at 11:15:42AM +0200, Petr Štetiar wrote:
> Sergei Shtylyov <sergei.shtylyov@cogentembedded.com> [2019-05-03 11:44:54]:
> 
> Hi Sergei,
> 
> > > diff --git a/drivers/of/of_net.c b/drivers/of/of_net.c
> > > index d820f3e..258ceb8 100644
> > > --- a/drivers/of/of_net.c
> > > +++ b/drivers/of/of_net.c
> > [...]
> > > @@ -64,6 +113,9 @@ static const void *of_get_mac_addr(struct device_node *np, const char *name)
> > >    * addresses.  Some older U-Boots only initialized 'local-mac-address'.  In
> > >    * this case, the real MAC is in 'local-mac-address', and 'mac-address' exists
> > >    * but is all zeros.
> > > + *
> > > + * Return: Will be a valid pointer on success, NULL in case there wasn't
> > > + *         'mac-address' nvmem cell node found, and ERR_PTR in case of error.
> > 
> >    Returning both NULL and error codes on failure is usually a sign of a
> > misdesigned API. 
> 
> well, then there's a lot of misdesigned APIs in the tree already, as I've just
> grepped for IS_ERR_OR_NULL usage and found this pointer/NULL/ERR_PTR usage
> pretty legit.
> 
> > Why not always return an error code?
> 
> I've received following comment[1] from Andrew:
> 
>  "What you have to be careful of, is the return value from your new code
>   looking in NVMEM. It should only return EPROBE_DEFER, or another error
>   if there really is expected to be a value in NVMEM, or getting it from
>   NVMEM resulted in an error."
> 
> So in order to fullfil this remark, I can't simply use ENOENT instead of
> current NULL, as the caller couldn't distinguish between ENOENT from
> of_get_mac_address or ENOENT from NVMEM subsystem.

ENOENT and its like have to be handled special by of_get_mac_address()
for all the different ways you can find the MAC address. It means that
method does not have a MAC address, try the next. And if at the end
you have not found a MAC address, ENOENT is a good return code, it
indicates none of the methods found a MAC address.

If you are using of_get_mac_address() you don't really care where the
MAC address came from, except you expect the documented search order.
So you don't need to know that NVMEM returned ENOENT. If you do care
about that, you would not use of_get_mac_address(), but directly go to
the NVMEM.

    Andrew
