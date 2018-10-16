From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 1/3] dt: bindings: add missing dt properties for
 WCN3990 wifi node
Date: Tue, 16 Oct 2018 15:53:39 -0700
Message-ID: <CAD=FV=WP-Xx+xeCGTxSFcSrmhAv-6F3zm-0hnLxhHi84u-fUkQ@mail.gmail.com>
References: <1539172376-19269-1-git-send-email-govinds@codeaurora.org> <1539172376-19269-2-git-send-email-govinds@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1539172376-19269-2-git-send-email-govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Oct 10, 2018 at 4:53 AM Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>
> Add missing optional properties in WCN3990 wifi node.
>
> Signed-off-by: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  .../bindings/net/wireless/qcom,ath10k.txt          | 28 ++++++++++++++++------
>  1 file changed, 21 insertions(+), 7 deletions(-)

Point of order: please CC LKML on _all_ your patches.  Yes, it's a
firehose.  CCing LKML allows your patches to be found on
lore.kernel.org's patchwork and also allows people to find your
patches via <https://lkml.kernel.org/r/MSG_ID> links.


> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> index 7fd4e8c..f831bb1 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> @@ -37,12 +37,20 @@ Optional properties:
>  - clocks: List of clock specifiers, must contain an entry for each required
>            entry in clock-names.
>  - clock-names: Should contain the clock names "wifi_wcss_cmd", "wifi_wcss_ref",
> -               "wifi_wcss_rtc".
> -- interrupts: List of interrupt lines. Must contain an entry
> -             for each entry in the interrupt-names property.
> +              "wifi_wcss_rtc" for "qcom,ipq4019-wifi" compatible target and
> +              "cxo_ref_clk_pin", "smmu_aggre2_noc_clk" for "qcom,wcn3990-wifi"
> +              compatible target.

I always get confused with these big bindings patches that hide
everything under a big "Optional properties" section to avoid
specifying which properties are actually optional and which ones are
required.

After your patch and thinking about "qcom,wcn3990-wifi" in particular,
it's unclear to me which of the following is true (or maybe something
totally different I didn't think of)

A) On wcn3990-wifi these clocks should be a required property but it's
only listed under "Optional" because it's not used for some of the
different WiFi drivers using this same bindings.

B) On wcn3990-wifi these clocks should either both be there or neither.

C) On wcm3990-wifi you can specify zero, either, or both of these
clocks.  AKA they are independently optional.

It might make sense to reorganize this bindings to make this clearer?
...not just for clock but for interrupts / regulators as well.  Maybe
you need to break this down into sections per class of compatible
string, or add a list per compatible string down below?

Also: even stranger is that even though you list two clocks here the
current driver I see in linuxnext only has "cxo_ref_clk_pin".


> +- interrupts: reference to the list of 17 interrupt no's for "qcom,ipq4019-wifi"
> +             compatible target.
> +             reference to the list of 12 interrupt no's for "qcom,wcn3990-wifi"
> +             compatible target.
> +             Must contain interrupt-names property per entry for
> +             "qcom,ath10k", "qcom,ipq4019-wifi" compatible targets.

...and just to add some credence to my concerns above, "interrupts"
are currently listed under "Optional" properties but I don't think
that the wcn3990 driver will actually work if you don't specify any of
the interrupts, right?  AKA for wcn3990 they are _not_ optional and
you must have exactly 12 interrupts.


One separate issue I have is with your example, which you didn't
change in this patch.  You should fix the example with the same
feedback that I had to your patch ("dts: arm64/sdm845: Add WCN3990
WLAN module device node").

-Doug
