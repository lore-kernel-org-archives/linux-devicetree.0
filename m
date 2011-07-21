From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [PATCH 1/2] Add character literal parsing in bytestrings
Date: Thu, 21 Jul 2011 07:41:57 -0500
Message-ID: <E1QjsZh-00024e-HY@jdl.com>
References: <1308871239-32683-1-git-send-email-robotboy@chromium.org>
	<1308871239-32683-2-git-send-email-robotboy@chromium.org>
	<20110720134006.GJ6399@yookeroo.fritz.box>
	<CAF6FioX-yYwd3FN106yCwJQD7N27J9XSiUseFHuhTWJGeq3pvw@mail.gmail.com>
	<20110721051903.GO6399@yookeroo.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20110721051903.GO6399-787xzQ0H9iQXU02nzanrWNbf9cGiqdzd@public.gmane.org> 
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Anton Staaf <robotboy-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

> 
> Well, to be honest I'd love to have this syntax several years ago :).
>
> [...]
>
> Ok, here's what I suggest.  For now, can you create a patch which
> recognizes the character construct syntax in the lexer (including
> escapes), and allows its use in cell context.  That won't actually do
> what you want, but it gets a fair chunk of the code in a testable,
> upstreamable form without making syntax changes I'm uncomfortable
> with.
> 
> While we're getting that merged we can debate which/how to proceed
> with either variable size cell syntax or allowing the character
> literals in bytestring context.

Is it worth investigating any of the work I did down this line
several years ago?  It's all still in the "test" branch if so.

jdl
