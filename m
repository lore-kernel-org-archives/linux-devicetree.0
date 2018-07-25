From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 6/9] dt-bindings: phy: add binding for
 Allwinner USB3 PHY
Date: Wed, 25 Jul 2018 09:31:26 -0600
Message-ID: <20180725153126.GA8350@rob-hp-laptop>
References: <20180722055739.26464-1-icenowy@aosc.io>
 <20180722055739.26464-7-icenowy@aosc.io>
 <CAGb2v65m6AEW=DO-cqLMyjfnaiZudm38hXufJL6LXdOrJqir_g@mail.gmail.com>
Reply-To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDJIP47K7MERBUFP4LNAKGQEUO7MPOY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAGb2v65m6AEW=DO-cqLMyjfnaiZudm38hXufJL6LXdOrJqir_g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jul 22, 2018 at 02:10:33PM +0800, Chen-Yu Tsai wrote:
> On Sun, Jul 22, 2018 at 1:57 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
> > The new Allwinner H6 SoC contains a USB3 PHY that is wired to the
> > external USB3 pins of the SoC.
> >
> > Add a device tree binding for the PHY.
> >
> > Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> > Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> > ---
> > Changes in v3:
> > - Added Chen-Yu's Review tag.
> >
> > Rob,
> > Although you mentioned that the supply is for the port, not the phy;
> > currently in USB situation "powering on the PHY" also indicates
> > "powering on the port" and nearly all usages of phy-supply is for Vbus.
> >
> > Maybe we should change the overall phy-supply to satisfy this.
> 
> Or maybe change it to vbus-supply, like we have for phy-sun4i-usb,
> until USB port power sequencing is added. (I remember there were
> patches for this. What happened?)

Once it is in the binding, we are stuck with it.

Connector bindings have landed. We should add vbus-supply to that. You 
don't have to have a property in the node associated with a driver. The 
phy driver can walk the tree and get the Vbus supply.

UniPhier has the same issue.

Rob
