From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V3 3/4] pinctrl: Add SPEAr3xx pinctrl drivers
Date: Fri, 13 Apr 2012 10:13:31 -0600
Message-ID: <4F8850AB.3090109@wwwdotorg.org>
References: <cover.1334207964.git.viresh.kumar@st.com>
 <61fe5fe87fdddfc66d21d82b1039de3782b50201.1334207964.git.viresh.kumar@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <61fe5fe87fdddfc66d21d82b1039de3782b50201.1334207964.git.viresh.kumar-qxv4g6HH51o@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/11/2012 11:24 PM, Viresh Kumar wrote:
> This adds pinctrl driver for SPEAr3xx family. SPEAr3xx family supports three
> families: SPEAr300, SPEAr310 and SPEAr320.

> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl_spear.txt

> +Required subnode-properties:
> +- st,pins : An array of strings. Each string contains the name of a pin or
> +  group.
> +- st,function: A string containing the name of the function to mux to the pin or
> +  group. See the SPEAr's TRM to determine which are valid for each pin or group.
> +
> +  Valid values for group and function names can be found from looking at the
> +  group and function arrays in driver files:
> +  drivers/pinctrl/spear/pinctrl-spear3*0.c

It might be nice to enumerate the pin/group/function names here, but if
they're identical to the TRM I guess it's fine not to.

Looking at the Tegra binding docs, I see I forgot to enumerate the
function names although I did enumerate everything else.
