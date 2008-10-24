From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: generating a phandle w/libfdt?
Date: Fri, 24 Oct 2008 09:18:34 -0500
Message-ID: <DEE70934-6A37-4439-B27E-FC3ABF75BF24@kernel.crashing.org>
References: <4BE3ADDA-362B-43AE-8D05-11260B94CD13@kernel.crashing.org>
Mime-Version: 1.0 (Apple Message framework v929.2)
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <4BE3ADDA-362B-43AE-8D05-11260B94CD13-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Oct 24, 2008, at 8:11 AM, Kumar Gala wrote:

> In some work I'm doing I noticed we don't have any APIs to generate  
> a phandle via libfdt.
>
> was wondering if anyone had ideas on this.
>
> In first thought it seems we have to scan through the whole blob  
> looking for the largest phandle id and than +1 it to generate the  
> next "valid" id.  Any other ideas on how to do this more efficiently?

The other question is there a way today to create a phandle even if  
there isn't a reference to it elsewhere in a .dts?

- k
