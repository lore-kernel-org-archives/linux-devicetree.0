From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 0/8] Implement a new DTS Source Language
Date: Tue, 23 Sep 2008 21:34:38 -0500
Message-ID: <097BFF8D-317F-4E85-AC2A-4C0A8D6C608B@kernel.crashing.org>
References: <1222196652-13811-1-git-send-email-jdl@jdl.com>
Mime-Version: 1.0 (Apple Message framework v929.2)
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <1222196652-13811-1-git-send-email-jdl-CYoMK+44s/E@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Sep 23, 2008, at 2:04 PM, Jon Loeliger wrote:

> This series of patches enhances the DTS source language to
> support a fullly interpreted language for generating nodes
> and properties.  It is backward compatible with V1 sources.
>
> The main features implemented by this patch set support
> function definitions, 'if', 'for', 'return' and assignment
> statements.  Local variables, global constants and
> almost complete C-like expressions are also supported.
>
> Enhancements to the source position and error/warning
> reporting now support source column positions too.
>
> Jon Loeliger (8):
>  Remove support for the legacy DTS source file format.
>  Add conditionalized debug() print macro.
>  Enhance source position implementation.
>  Add header files for new Internal Representation form.
>  Add most of the new IR implementation files.
>  Add the main IR evaluation implementation
>  Introduce new DTS language.
>  Add documentation for the new DTS language.

Any examples/tests of all the cool new features?

- k
