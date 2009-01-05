From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: The usage of compatible 'simple-bus'
Date: Mon, 5 Jan 2009 13:20:53 -0600
Message-ID: <20090105192053.GB23766@ld0162-tx32.am.freescale.net>
References: <3A45394FD742FA419B760BB8D398F9ED0B37E7@zch01exm26.fsl.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3A45394FD742FA419B760BB8D398F9ED0B37E7-bKEhWGtIRUJ4Lp7cDGe+DVjVikpgYyvb5NbjCUgZEJk@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Li Yang <LeoLi-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 05, 2009 at 06:27:39PM +0800, Li Yang wrote:
> I got an assumption from the existing device trees that having
> 'simple-bus' in the compatible property of a node means that all child
> nodes should be added as of_platform_device in platform initialization
> phase.  No matter it represents a bus in common sense or not.  Is this
> truly the case? 

Yes, simple-bus indicates that the children can be driven standalone from
any knowledge of the parent bus.

> Shall we document this?

It is documented in ePAPR.

-Scott
