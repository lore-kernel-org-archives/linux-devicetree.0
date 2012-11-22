From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 00/14] ARM: SPEAr: DT updates
Date: Thu, 22 Nov 2012 10:47:38 +0100
Message-ID: <CACRpkdbsDzYuUJpVAS=ujv7EEq_nA-kAzHnN1F0d3WqoMEeCUg@mail.gmail.com>
References: <cover.1352608333.git.viresh.kumar@linaro.org>
 <201211121521.58766.arnd@arndb.de>
 <CAKohpom0kMjuHx5jO-LTPKQhy_-r4khKi7UBPB_O-50K42FOeQ@mail.gmail.com>
 <20121121202405.GA15549@quad.lixom.net>
 <CAKohpokMUTQja6tCz1RmKXFgu+X7MGFAi1+UWLgKhpViOuiMSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAKohpokMUTQja6tCz1RmKXFgu+X7MGFAi1+UWLgKhpViOuiMSA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sr-ynQEQJNshbs@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 22, 2012 at 4:19 AM, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> Last week i had chat with Arnd and Linus over Hangout, and following is
> the status:
> - Dependency patch of pinctrl is:
>
> commit 4ddb1c295752252f61670e35c791bf16e58bbce6
> Author: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Date:   Sat Oct 27 15:21:39 2012 +0530
>
>     ARM: SPEAr: Add plgpio node in device tree dtsi files
>
> And is already in pinctrl/devel branch. And this branch is stable as per Linus.

Well, famous last words. But that commit and below should
be perfectly fine to pull into ARM SoC if need be. As long
as we don't create too big a cobweb ... with linux-next not
being done this week I'd watch it for this kind of stuff at this
stage.

Yours,
Linus Walleij
