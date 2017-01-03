From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 4/4] phy: qcom-qmp: new qmp phy driver for
 qcom-chipsets
Date: Tue, 3 Jan 2017 11:24:29 -0800
Message-ID: <20170103192429.GL10531@minitux>
References: <1482253431-23160-1-git-send-email-vivek.gautam@codeaurora.org>
 <1482253431-23160-5-git-send-email-vivek.gautam@codeaurora.org>
 <20161228231659.GD17126@codeaurora.org>
 <CAFp+6iF0FQjt3bt1d_HjYmpMb8cTkg+BudoNR7yzThd+EgZfQg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAFp+6iF0FQjt3bt1d_HjYmpMb8cTkg+BudoNR7yzThd+EgZfQg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, robh+dt <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kishon <kishon-l0cyMroinI0@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed 28 Dec 23:39 PST 2016, Vivek Gautam wrote:

> >> + *
> >> + */
> >> +static int phy_pipe_clk_register(struct qcom_qmp_phy *qphy, int id)
> >> +{
> >> +     char clk_name[MAX_PROP_NAME];
> >
> > I'm not sure MAX_PROP_NAME is the same as some max clk name but
> > ok. We should be able to calculate that the maximum is length of
> > usb3_phy_pipe_clk_src for now though?
> 
> Yea, i thought of using the same macro, considering that it provides
> 32 characters :-)
> Will rather use the length of usb3_phy_pipe_clk_src for now. May be
> #define MAX_CLK_NAME   24
> 

Using a macro indicates that the size have some global meaning, but as
far as I can see it doesn't. Just write 24 and you will have enough
space for 100k pcie pipe clocks. And then use sizeof(clk_name) below.

> >
> >> +     struct clk *clk;
> >> +
> >> +     memset(&clk_name, 0, sizeof(clk_name));

There's no point in clearing clk_name, as it will be overwritten
and nul-terminated below.

> >> +     switch (qphy->cfg->type) {
> >> +     case PHY_TYPE_USB3:
> >> +             snprintf(clk_name, MAX_PROP_NAME, "usb3_phy_pipe_clk_src");
> >> +             break;
> >> +     case PHY_TYPE_PCIE:
> >> +             snprintf(clk_name, MAX_PROP_NAME, "pcie_%d_pipe_clk_src", id);
> >> +             break;
> >> +     default:
> >> +             return -EINVAL;
> >> +     }
> >> +
> >> +     /* controllers using QMP phys use 125MHz pipe clock interface */
> >> +     clk = clk_register_fixed_rate(qphy->dev, clk_name, NULL, 0, 125000000);

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
