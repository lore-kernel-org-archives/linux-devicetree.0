From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC V3 PATCH 5/7] arm64: dts: msm8994 SoC and Huawei Angler
 (Nexus 6P) support
Date: Wed, 12 Oct 2016 09:20:11 -0500
Message-ID: <CAL_JsqLMs3cE6qne_GN-3E7c1ub_6U0y5UF0aLkxUD=k5fiOTw@mail.gmail.com>
References: <1476265054-22511-1-git-send-email-jeremymc@redhat.com>
 <1476265054-22511-6-git-send-email-jeremymc@redhat.com> <20161012133450.GC21050@remoulade>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161012133450.GC21050@remoulade>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 12, 2016 at 8:34 AM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> On Wed, Oct 12, 2016 at 02:37:32AM -0700, Jeremy McNicoll wrote:
>> +/ {
>> +     model = "HUAWEI MSM8994 ANGLER rev-1.01";
>> +     compatible = "qcom,msm8994";
>> +     qcom,board-id= <8026 0>;
>> +};
>
> This last property is undocumented, and unused.

They are required by the bootloader which AIUI can't/won't be updated
to use the mainline compatible string. The alternative is leave them
out and then you have to run the dtb thru QC's dtbTool to add them
which is worse IMO.

I'd also leave them undocumented as we want to minimize their usage.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
