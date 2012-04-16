From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] pinctrl: pinconf: Fix compilation error if PINCONF is not
 selected
Date: Mon, 16 Apr 2012 11:09:35 +0200
Message-ID: <CACRpkdZFpknFE+WJ7-RnSti1MAJvwr=6QM98MkVrWDO+YHcy=g@mail.gmail.com>
References: <a342987ffebf0ab79a789011e17081e0169bdf24.1334566321.git.viresh.kumar@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <a342987ffebf0ab79a789011e17081e0169bdf24.1334566321.git.viresh.kumar-qxv4g6HH51o@public.gmane.org>
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

On Mon, Apr 16, 2012 at 10:52 AM, Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org> wrote:

> When we compile pinctrl layer for platforms without CONFIG_PINCONF, we get
> following compilation errors:
>
> drivers/built-in.o: In function `pinctrl_show':
> linux-2.6/drivers/pinctrl/core.c:1116: undefined
> reference to `pinconf_show_setting'
> drivers/built-in.o: In function `pinctrl_maps_show':
> linux-2.6/drivers/pinctrl/core.c:1071: undefined
> reference to `pinconf_show_map'
> drivers/built-in.o: In function `pinctrl_init_device_debugfs':
> linux-2.6/drivers/pinctrl/core.c:1224: undefined
> reference to `pinconf_init_device_debugfs'
> make[1]: *** [.tmp_vmlinux1] Error 1
>
> This patch fixes this.
>
> Signed-off-by: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>

Ooops! Patch applied. Will push this for the -rc:s.

Thanks,
Linus Walleij
