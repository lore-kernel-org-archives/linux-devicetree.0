From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/5] scripts: dtc: Merge in changes from the dtc repository
Date: Tue, 16 Nov 2010 23:11:27 -0700
Message-ID: <AANLkTinYZYR_QtS5-Nodpaf2MBBuaw06SW9pDCNQ9ov3@mail.gmail.com>
References: <20101116204917.12146.39851.stgit@riker>
	<20101116204951.12146.21084.stgit@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20101116204951.12146.21084.stgit@riker>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 16, 2010 at 1:49 PM, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> Pull in recent changes from the main dtc repository. These changes primar=
ily
> allow multiple device trees to be declared which are merged by dtc. This
> feature allows us to include a basic dts file and then provide more infor=
mation
> for the specific system through the merging functionality.
>
> Signed-off-by: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> ---
>
> =A00 files changed, 0 insertions(+), 0 deletions(-)

???  Something isn't right in patch generation.

Also:

~/hacking/linux-2.6$ xc-6xx make -j3
  GEN     /home/grant/hacking/linux-2.6.build/6xx/Makefile
  HOSTCC  scripts/kconfig/zconf.tab.o
  HOSTLD  scripts/kconfig/conf
scripts/kconfig/conf --silentoldconfig Kconfig
#
# configuration written to .config
#
  GEN     /home/grant/hacking/linux-2.6.build/6xx/Makefile
  CHK     include/linux/version.h
  UPD     include/linux/version.h
  HOSTCC  scripts/dtc/checks.o
In file included from /home/grant/hacking/linux-2.6/scripts/dtc/checks.c:21:
/home/grant/hacking/linux-2.6/scripts/dtc/dtc.h:37: fatal error:
util.h: No such file or directory
compilation terminated.
make[3]: *** [scripts/dtc/checks.o] Error 1
make[2]: *** [scripts/dtc] Error 2
make[1]: *** [scripts] Error 2
make[1]: *** Waiting for unfinished jobs....
make: *** [sub-make] Error 2
(devicetree/test) ~/hacking/linux-2.6$

Looks like the updated dtc is broken.

g.
