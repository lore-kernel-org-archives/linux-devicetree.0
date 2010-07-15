From: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: [PATCH 2/3] of/flattree: Fix crash when device tree absent
Date: Thu, 15 Jul 2010 15:26:16 +0800
Message-ID: <1279178776.15089.81.camel@pororo.lan>
References: <20100714233130.21887.73872.stgit@angua>
	<20100714233136.21887.27766.stgit@angua>
	<1279156262.15089.68.camel@pororo.lan>
	<AANLkTikD3ZhhVg4PTuG5Zkc38oW1I6yaQyKqcv9rAaoR@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTikD3ZhhVg4PTuG5Zkc38oW1I6yaQyKqcv9rAaoR-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Grant,

> Probably a good idea.  We'll need more robust dtb pointer checking
> with ARM.  I'll do that in a separate patch.

I do some checking in the boot path already, so we're safe from getting
inital_boot_params set to something bogus anyway.

http://kernel.ubuntu.com/git?p=jk/dt/linux-2.6.git;a=commitdiff;h=c973251ad8d36f777b1c4c8e2cb99d37bf577cf0#patch2

Cheers,


Jeremy
