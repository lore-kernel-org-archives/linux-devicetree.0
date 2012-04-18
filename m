From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V4 3/5] pinctrl: Add SPEAr pinctrl drivers
Date: Wed, 18 Apr 2012 13:24:14 +0200
Message-ID: <CACRpkda6fPPsHiCoKAJScOsdGNxFru2baPxj7B88La+axboC-A@mail.gmail.com>
References: <cover.1334548272.git.viresh.kumar@st.com>
 <f9cc539f87a9c73546fe6671d55d86838886adce.1334548272.git.viresh.kumar@st.com>
 <4F8D2A88.6060309@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4F8D2A88.6060309-qxv4g6HH51o@public.gmane.org>
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

On Tue, Apr 17, 2012 at 10:32 AM, Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org> wrote:

> This was the place that caused crash for me.
>
> I would apply following change in my patch before sending pull request
> to Arnd.
>
> - =A0 =A0 =A0 *map =3D kzalloc(sizeof(*map) * count, GFP_KERNEL);
> + =A0 =A0 =A0 *map =3D kzalloc(sizeof(**map) * count, GFP_KERNEL);

Ah, great you found it!

Thanks,
Linus Walleij
