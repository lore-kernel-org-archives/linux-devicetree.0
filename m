From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V3 1/4] SPEAr: Remove existing padmux support for SPEAr
Date: Fri, 13 Apr 2012 15:00:11 +0200
Message-ID: <CACRpkdY=5X9Nz+GFY5g0pHgEpfHOEm46R9LBeAWcD7s31pkFDQ@mail.gmail.com>
References: <cover.1334207964.git.viresh.kumar@st.com>
 <e45ccf333041c3aa12b7dd821545d5e436c9d1ec.1334207964.git.viresh.kumar@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <e45ccf333041c3aa12b7dd821545d5e436c9d1ec.1334207964.git.viresh.kumar-qxv4g6HH51o@public.gmane.org>
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

On Thu, Apr 12, 2012 at 7:24 AM, Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org> wrote:

> We must use pinctrl framework instead of defining per SoC pinmux drivers. This
> patch removes existing padmux support present for SPEAr platform.
>
> Signed-off-by: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>

FWIW: Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

But I think Viresh is the maintainer of these files :)

Yours,
Linus Walleij
