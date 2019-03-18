From: Chen-Yu Tsai <wens-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/6] nvmem: sunxi_sid: Read out data in
 native format
Date: Mon, 18 Mar 2019 16:45:19 +0800
Message-ID: <CAGb2v67H9FkjKjSE5a7fUCb_t95Zfuk1p0bjWYJxjMqhMN-hfg@mail.gmail.com>
References: <20190318073354.12151-1-wens@kernel.org> <20190318073354.12151-5-wens@kernel.org>
 <20190318084212.lv2lorskizl65uzg@flea>
Reply-To: wens-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBL5VXXSAKGQE3HWUU3I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190318084212.lv2lorskizl65uzg@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 18, 2019 at 4:42 PM Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
>
> Hi,
>
> On Mon, Mar 18, 2019 at 03:33:52PM +0800, Chen-Yu Tsai wrote:
> > From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> >
> > Originally the SID e-fuses were thought to be in big-endian format.
> > Later sources show that they are in fact native or little-endian.
> > The most compelling evidence is the thermal sensor calibration data,
> > which is a set of one to three 16-bit values. In native-endian they
> > are in 16-bit cells with increasing offsets, whereas with big-endian
> > they are in the wrong order, and a gap with no data will show if there
> > are one or three cells.
> >
> > Switch to a native endian representation for the nvmem device. For the
> > H3, the register read-out method was already returning data in native
> > endian. This only affects the other SoCs.
> >
> > Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>
> I thought only the newer SoCs were impacted by this issue?

It is noticable on the newer SoCs. The old ones only have the 128-bit SID,
which could be read either way, as AFAIK it's just a serial number.

If you think we should leave the old ones alone I can factor that in.

ChenYu
