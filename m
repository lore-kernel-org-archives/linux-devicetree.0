From: Balbir Singh <bsingharora@gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: add doc for ibm,hotplug-aperture
Date: Thu, 11 Aug 2016 14:12:31 +1000
Message-ID: <92e34173-b2e2-bac0-3bbb-fc5407cbb8a5@gmail.com>
References: <1470680843-28702-1-git-send-email-arbab@linux.vnet.ibm.com>
 <1470680843-28702-2-git-send-email-arbab@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1470680843-28702-2-git-send-email-arbab@linux.vnet.ibm.com>
Sender: owner-linux-mm@kvack.org
To: Reza Arbab <arbab@linux.vnet.ibm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Jonathan Corbet <corbet@lwn.net>, Bharata B Rao <bharata@linux.vnet.ibm.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Alistair Popple <apopple@au1.ibm.com>, Stewart Smith <stewart@linux.vnet.ibm.com>
List-Id: devicetree@vger.kernel.org



On 09/08/16 04:27, Reza Arbab wrote:
> Signed-off-by: Reza Arbab <arbab@linux.vnet.ibm.com>
> ---
>  .../bindings/powerpc/opal/hotplug-aperture.txt     | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/powerpc/opal/hotplug-aperture.txt
> 
> diff --git a/Documentation/devicetree/bindings/powerpc/opal/hotplug-aperture.txt b/Documentation/devicetree/bindings/powerpc/opal/hotplug-aperture.txt
> new file mode 100644
> index 0000000..b8dffaa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/powerpc/opal/hotplug-aperture.txt
> @@ -0,0 +1,26 @@
> +Designated hotplug memory
> +-------------------------
> +
> +This binding describes a region of hotplug memory which is not present at boot,
> +allowing its eventual NUMA associativity to be prespecified.
> +
> +Required properties:
> +
> +- compatible
> +	"ibm,hotplug-aperture"
> +
> +- reg
> +	base address and size of the region (standard definition)
> +
> +- ibm,associativity
> +	NUMA associativity (standard definition)
> +
> +Example:
> +
> +A 2 GiB aperture at 0x100000000, to be part of nid 3 when hotplugged:
> +
> +	hotplug-memory@100000000 {
> +		compatible = "ibm,hotplug-aperture";
> +		reg = <0x0 0x100000000 0x0 0x80000000>;
> +		ibm,associativity = <0x4 0x0 0x0 0x0 0x3>;
> +	};
> 

+Stewart and Alistair

Looks good to me!

Acked-by: Balbir Singh <bsingharora@gmail.com>

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
