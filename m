From: Michal Marek <mmarek-AlSwsSmVLrQ@public.gmane.org>
Subject: Re: [RFC PATCH v3 1/6] of: Allow scripts/dtc/libfdt to be used from
	kernel code
Date: Fri, 06 May 2011 12:56:21 +0200
Message-ID: <4DC3D3D5.6060007@suse.cz>
References: <1304614949-30460-1-git-send-email-ddaney@caviumnetworks.com>
	<1304614949-30460-2-git-send-email-ddaney@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1304614949-30460-2-git-send-email-ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 5.5.2011 19:02, David Daney wrote:
> --- /dev/null
> +++ b/drivers/of/libfdt/Makefile
> @@ -0,0 +1,8 @@
> +ccflags-y := -include linux/libfdt_env.h -I$(src)/../../../scripts/dtc/libfdt
> +
> +obj-y = fdt.o fdt_wip.o fdt_ro.o
> +
> +
> +$(obj)/%.o: $(src)/../../../scripts/dtc/libfdt/%.c FORCE
> +	$(call cmd,force_checksrc)
> +	$(call if_changed_rule,cc_o_c)

It's just three source files, so you could use three one-line wrappers 
that #include ../../../scripts/dtc/libfdt/<file>.c instead of copying 
the %.c -> %.o rule here.

Michal
