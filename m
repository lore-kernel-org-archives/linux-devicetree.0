From: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/5] arm64: dts: apq8016-sbc: move sdhci node under soc
 node
Date: Tue, 12 Jan 2016 16:25:56 -0600
Message-ID: <20160112222556.GB4125@hector.attlocal.net>
References: <1452606358-24569-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1452606412-24659-1-git-send-email-srinivas.kandagatla@linaro.org>
 <18094818.3Fy0P66y0u@wuerfel>
 <56950B4D.3030707@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56950B4D.3030707-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 12, 2016 at 02:18:53PM +0000, Srinivas Kandagatla wrote:
> 
> 
> On 12/01/16 14:00, Arnd Bergmann wrote:
> >On Tuesday 12 January 2016 13:46:52 Srinivas Kandagatla wrote:
> >>To be consistent with other nodes move sdhci node under the soc node,
> >>rather than using lable references.
> >>
> >>Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >>
> >
> >Maybe remove the label as well if you are no longer using it?
> Label "sdhc_1" in this case is used in aliases node.
> 
> >
> My understanding so far was qcom specific dt want to use hierarchical dt
> nodes in the board files, but this brings the question of should we delete
> all the unused labels.
> 
> IMO, some unused labels are harmless and would give more consistency to the
> reader, removing them might not add great value.
> 
> Andy/Stephen, any comments?

I tend to lean towards leaving the labels in.  But at the same time we don't
want to get cluttered with unused labels.  That said, perhaps If the label
makes things more understandable, then leave them in.  Otherwise, they really
have no use.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
