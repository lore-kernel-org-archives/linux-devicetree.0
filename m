From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V3 4/4] SPEAr3xx: Add pinctrl support for boards
Date: Fri, 13 Apr 2012 10:18:45 -0600
Message-ID: <4F8851E5.7050509@wwwdotorg.org>
References: <cover.1334207964.git.viresh.kumar@st.com>
 <81b04bd4fe751633802e539d724facce80e600a4.1334207964.git.viresh.kumar@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <81b04bd4fe751633802e539d724facce80e600a4.1334207964.git.viresh.kumar-qxv4g6HH51o@public.gmane.org>
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
> Signed-off-by: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>

Just a couple of minor comments below.

> diff --git a/arch/arm/boot/dts/spear300-evb.dts b/arch/arm/boot/dts/spear300-evb.dts

> +		pinmux@99000000 {
> +			st,pinmux-mode=<2>;

spaces around = here for consistency?

> +			state_default: pinmux {
> +				i2c0 {
> +					st,pins = "i2c0_grp";
> +					st,function = "i2c0";
> +				};

Do the group names need the "_grp" suffix? If that's what's in your TRM,
it's fine by me, but I'd guess that isn't the case, and if so I'd say
either drop the _grp suffix here, or enhance the binding documentation
to mention the need to add this suffix when writing the .dts file.
