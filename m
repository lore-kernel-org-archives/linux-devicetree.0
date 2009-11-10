From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 3/3] mpc52xx/wdt: WDT uses GPT api
Date: Tue, 10 Nov 2009 12:59:22 -0700
Message-ID: <fa686aa40911101159y7bef3f9bte74e9aeb5c6e864b@mail.gmail.com>
References: <1257882180.14374.3@antares>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1257882180.14374.3@antares>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: =?ISO-8859-1?Q?Albrecht_Dre=DF?= <albrecht.dress-KvP5wT2u2U0@public.gmane.org>
Cc: Linux PPC Development <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 10, 2009 at 12:43 PM, Albrecht Dre=DF <albrecht.dress-KvP5wT2u2U0@public.gmane.org>=
 wrote:
> Use the MPC5200 GPT api for the WDT which drastically simplifies this fil=
e.
>
> Signed-off-by: Albrecht Dre=DF <albrecht.dress-KvP5wT2u2U0@public.gmane.org>
> ---
>
> =A0drivers/watchdog/mpc5200_wdt.c | =A0246 +++++++++++-------------------=
----------
> =A01 files changed, 65 insertions(+), 181 deletions(-)


Can the WDT functionality just be merged entirely into
arch/powerpc/platforms/52xx/mpc52xx_gpt.c, eliminating the need for
this file entirely?  I think I'd rather have all the GPT "built in"
behaviour handled by a single driver.

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
