From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] libnvdimm: Add a device-tree interface
Date: Thu, 16 Nov 2017 08:29:26 -0600
Message-ID: <20171116142926.cdvx2st72tnu7gi7@rob-hp-laptop>
References: <20171115175131.23631-1-oohall@gmail.com>
 <20171115175131.23631-2-oohall@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171115175131.23631-2-oohall-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.01.org/mailman/options/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.01.org/pipermail/linux-nvdimm/>
List-Post: <mailto:linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
List-Help: <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=help>
List-Subscribe: <https://lists.01.org/mailman/listinfo/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=subscribe>
Errors-To: linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
Sender: "Linux-nvdimm" <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
To: Oliver O'Halloran <oohall-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 16, 2017 at 04:51:30AM +1100, Oliver O'Halloran wrote:
> A fairly bare-bones set of device-tree bindings so libnvdimm can be used
> on powerpc and other device-tree based platforms.
> 
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Oliver O'Halloran <oohall-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../devicetree/bindings/nvdimm/nvdimm-bus.txt      |  69 +++++++

Also, please split bindings to a separate patch.

>  MAINTAINERS                                        |   8 +
>  drivers/nvdimm/Kconfig                             |  10 +
>  drivers/nvdimm/Makefile                            |   1 +
>  drivers/nvdimm/of_nvdimm.c                         | 202 +++++++++++++++++++++
>  5 files changed, 290 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvdimm/nvdimm-bus.txt
>  create mode 100644 drivers/nvdimm/of_nvdimm.c
