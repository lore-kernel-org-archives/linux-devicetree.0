From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 0/3] SH pinctrl DT support
Date: Tue, 18 Jun 2013 10:05:30 +0200
Message-ID: <CACRpkdZh709J3pFsfbReQ20LU5W0Q1HacE0ZpssWXofKTJJ6pQ@mail.gmail.com>
References: <1371495003-11185-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1371495003-11185-1-git-send-email-laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <damm-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>, "linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 17, 2013 at 8:50 PM, Laurent Pinchart
<laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org> wrote:

> Hello,
>
> Here's the seventh (and hopefully final) version of the SuperH and SH Mobile
> pin controllers (PFC) DT support patch set.
>
> The patches have been rebased on the for-next branch of the pinctrl
> repository. All ARM-specific patches have been dropped and will be pushed
> through to ARM SoC tree in v3.12. This series thus only contains DT support
> for the sh-pfc driver.
>
> I've tried merging Simon's latest tag (renesas-next-20130617v3) with these
> patches and no conflict occurred. Linus, would it finally be possible to get
> this applied for v3.11 ?
>
> Changes since v6:
>
> - Added generic pinconf support back
> - Dropped all ARM-specific patches

Thanks, this looks really nice and I've applied all three.

Heiko, James can you have a look from a generic pinconf
point of view so we are sure we get this right? (Looks right
to me atleast.)

Yours,
Linus Walleij
