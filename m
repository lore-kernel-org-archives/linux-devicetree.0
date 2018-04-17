From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 1/3] nvmem: Update the OF binding to use a subnode for
 the cells list
Date: Tue, 17 Apr 2018 13:54:07 +0100
Message-ID: <344e0087-7410-aebb-8a66-c6976064df10@linaro.org>
References: <1521933899-362-1-git-send-email-albeu@free.fr>
 <1521933899-362-2-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1521933899-362-2-git-send-email-albeu@free.fr>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alban Bedel <albeu@free.fr>, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 24/03/18 23:24, Alban Bedel wrote:
> Having the cells as subnodes of the provider device without any
> compatible property might clash with other bindings. To avoid this
> problem update the binding to have all the cells in a 'nvmem-cells'
> subnode with a 'nvmem-cells' compatible string. This new binding
> guarantee that we can turn any kind of device in a nvmem provider.
> 
> While discouraged for new uses the old scheme is still supported for
> backward compatibility.

Am not sure if this a really good idea to change nvmem bindings based on 
provider requirements. This can be a beginning of other problems!!

Did you know that we can pass nvmem cells info via nvmem config ?

Why can't mtd-nvmem provider populate the nvmem_config->cells from its 
dt "nvmem-cells" subnode before it registers the provider?

Doing this way will make the binding very much specific to the provider 
rather than changing nvmem core bindings.

thanks,
srini
