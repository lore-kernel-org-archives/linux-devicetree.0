From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH 0/4] Removing full paths from DT full_name
Date: Wed, 26 Jul 2017 07:20:36 -0700
Message-ID: <5978A534.5030008@gmail.com>
References: <20170725214427.25768-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <20170725214427.25768-1-robh@kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Paul Mackerras <paulus@samba.org>, linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 07/25/17 14:44, Rob Herring wrote:
> This series is the last steps to remove storing the full path for every 
> DT node. Instead, we can create full path strings dynamically as needed 
> with printf %pOF specifiers (commit ce4fecf1fe15). There are a number of 
> remaining direct users of full_name after this series. I don't believe 
> there should be any functional impact for those users with the change to 
> only the node name (+unit-address). The majority are for struct 
> resource.name. This should only affect /proc/iomem display.

I added a new dependency on full_name in:

  [PATCH v4 3/3] of: overlay: add overlay symbols to live device tree

You don't need to fix that -- I knew the removal of full_name was coming
and expected to adapt to that change when it came, so I'll take care of
it.  It will probably take me two or three weeks to get to it, but that
shouldn't be a big deal since the affected code is a new feature that
is not yet used.

-Frank

> 
> Patches 1 and 2 can be applied now for 4.14. For patches 3 and 4, my 
> target is 4.15 after all the dependencies have been merged.
> 
> PPC folks, Please test! The PPC parts are untested. A git branch with 
> all the dependencies is here[1].
> 
> Rob
> 
> [1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-printf
> 
> Rob Herring (4):
>   powerpc: pseries: vio: match parent nodes with of_find_node_by_path
>   powerpc: pseries: remove dlpar_attach_node dependency on full path
>   powerpc: pseries: only store the device node basename in full_name
>   of/fdt: only store the device node basename in full_name
> 
>  arch/powerpc/platforms/pseries/dlpar.c       | 26 +++--------
>  arch/powerpc/platforms/pseries/hotplug-cpu.c |  2 +-
>  arch/powerpc/platforms/pseries/mobility.c    |  2 +-
>  arch/powerpc/platforms/pseries/pseries.h     |  2 +-
>  arch/powerpc/platforms/pseries/reconfig.c    |  2 +-
>  arch/powerpc/platforms/pseries/vio.c         |  4 +-
>  drivers/of/fdt.c                             | 69 +++++-----------------------
>  7 files changed, 23 insertions(+), 84 deletions(-)
> 
