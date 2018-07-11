From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v2 04/18] drm/sun4i: tcon-top: Cleanup clock handling
Date: Wed, 11 Jul 2018 10:54:46 +0800
Message-ID: <CAGb2v64h4PvgGkn_q7WW5k0mEjv9_bQ40zOK6KK+S3xdpJCzgg@mail.gmail.com>
References: <20180710203511.18454-5-jernej.skrabec@siol.net> <201807110632.6k3QA7Vs%fengguang.wu@intel.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBDPDSXNAKGQEZCGSRLI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <201807110632.6k3QA7Vs%fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: kbuild-all-JC7UmRfGjtg@public.gmane.org, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 11, 2018 at 7:20 AM, kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> wrote:
> Hi Jernej,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on next-20180710]
> [cannot apply to sunxi/sunxi/for-next drm/drm-next robh/for-next v4.18-rc4 v4.18-rc3 v4.18-rc2 v4.18-rc4]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>
> url:    https://github.com/0day-ci/linux/commits/Jernej-Skrabec/Allwinner-R40-HDMI-refactoring/20180711-043932
> config: arm64-allyesconfig (attached as .config)
> compiler: aarch64-linux-gnu-gcc (Debian 7.2.0-11) 7.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.2.0 make.cross ARCH=arm64
>
> All warnings (new ones prefixed by >>):
>
>    In file included from include/linux/kernel.h:10:0,
>                     from include/linux/list.h:9,
>                     from include/linux/agp_backend.h:33,
>                     from include/drm/drmP.h:35,
>                     from drivers/gpu//drm/sun4i/sun8i_tcon_top.c:4:
>    drivers/gpu//drm/sun4i/sun8i_tcon_top.c: In function 'sun8i_tcon_top_register_gate':
>    include/linux/err.h:22:49: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>     #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >= (unsigned long)-MAX_ERRNO)
>                                                     ^
>    include/linux/compiler.h:77:42: note: in definition of macro 'unlikely'
>     # define unlikely(x) __builtin_expect(!!(x), 0)
>                                              ^
>>> drivers/gpu//drm/sun4i/sun8i_tcon_top.c:56:6: note: in expansion of macro 'IS_ERR_VALUE'
>      if (IS_ERR_VALUE(index))
>          ^~~~~~~~~~~~
>
> vim +/IS_ERR_VALUE +56 drivers/gpu//drm/sun4i/sun8i_tcon_top.c
>
>      3
>    > 4  #include <drm/drmP.h>
>      5
>      6  #include <dt-bindings/clock/sun8i-tcon-top.h>
>      7
>      8  #include <linux/bitfield.h>
>      9  #include <linux/component.h>
>     10  #include <linux/device.h>
>     11  #include <linux/module.h>
>     12  #include <linux/of_graph.h>
>     13  #include <linux/platform_device.h>
>     14
>     15  #include "sun8i_tcon_top.h"
>     16
>     17  static int sun8i_tcon_top_get_connected_ep_id(struct device_node *node,
>     18                                                int port_id)
>     19  {
>     20          struct device_node *ep, *remote, *port;
>     21          struct of_endpoint endpoint;
>     22
>     23          port = of_graph_get_port_by_id(node, port_id);
>     24          if (!port)
>     25                  return -ENOENT;
>     26
>     27          for_each_available_child_of_node(port, ep) {
>     28                  remote = of_graph_get_remote_port_parent(ep);
>     29                  if (!remote)
>     30                          continue;
>     31
>     32                  if (of_device_is_available(remote)) {
>     33                          of_graph_parse_endpoint(ep, &endpoint);
>     34
>     35                          of_node_put(remote);
>     36
>     37                          return endpoint.id;
>     38                  }
>     39
>     40                  of_node_put(remote);
>     41          }
>     42
>     43          return -ENOENT;
>     44  }
>     45
>     46  static struct clk_hw *sun8i_tcon_top_register_gate(struct device *dev,
>     47                                                     const char *parent,
>     48                                                     void __iomem *regs,
>     49                                                     spinlock_t *lock,
>     50                                                     u8 bit, int name_index)
>     51  {
>     52          const char *clk_name, *parent_name;
>     53          int ret, index;
>     54
>     55          index = of_property_match_string(dev->of_node, "clock-names", parent);
>   > 56          if (IS_ERR_VALUE(index))

Yeah. This is incorrect usage. IS_ERR_VALUE should be used on pointers.
Checking for a negative value here should suffice.

ChenYu

>     57                  return ERR_PTR(index);
>     58
>     59          parent_name = of_clk_get_parent_name(dev->of_node, index);
>     60
>     61          ret = of_property_read_string_index(dev->of_node,
>     62                                              "clock-output-names", name_index,
>     63                                              &clk_name);
>     64          if (ret)
>     65                  return ERR_PTR(ret);
>     66
>     67          return clk_hw_register_gate(dev, clk_name, parent_name,
>     68                                      CLK_SET_RATE_PARENT,
>     69                                      regs + TCON_TOP_GATE_SRC_REG,
>     70                                      bit, 0, lock);
>     71  };
>     72
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
