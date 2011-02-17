From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 0/7] Add Samsung's s5pv310 machine with device tree enabled
Date: Wed, 16 Feb 2011 17:39:49 -0700
Message-ID: <AANLkTi=JHEc1Kw7rhyE4OOADu5qtPwCtqL-=_FFRoeZL@mail.gmail.com>
References: <1297514825-10345-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1297514825-10345-1-git-send-email-thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Feb 12, 2011 at 5:46 AM, Thomas Abraham
<thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> This patchset adds Samsung's s5pv310 machine with device tree support. Th=
is
> is based on
>
> git://git.secretlab.ca/git/linux-2.6 devicetree/test
>
> A new machine s5pv310-dt is added along with a dts file for the smdkv310 =
board.
> Some of the features introduced in this patchset are
>
> 1. Tested on smdkv310 board and information such as bootargs, memory info=
rmation
> =A0 and console port register defaults are obtained from the device tree.
> 2. Add basic device tree file for smdkv310 board.
> 3. Device tree based probe enabled in watchdog timer driver (s3c2410-wdt).
> 4. UART driver modified to obtain default console register values from
> =A0 device tree.

Thanks Thomas,

I've picked up patches 1-3 into my devicetree/test branch.  They still
require some work, but they are close enough that I'm happy to at
least have them in my series.  You can either send me replacement
patches as need be, or build on top of devicetree/test.

The remainder I've commented on and I'll leave alone until I get the
next version.

g.


-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
