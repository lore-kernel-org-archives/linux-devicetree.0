From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org: Fix bug in -Odts with properties
	containing multiple terminating nulls]
Date: Wed, 11 Nov 2009 07:37:55 -0600
Message-ID: <E1N8DOV-0000Tk-SU@jdl.com>
References: <20091111054046.GE3235@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20091111054046.GE3235-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org> 
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

> When in -Odts mode, dtc will not produce correct output for
> string-like properties which have more than one \0 character at the
> end of the property's bytestring.  In fact, it generates output which
> is not syntactically correct.  This patch fixes the bug, and adds a
> testcase for future regressions here.
> 
> Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Applied.

Apologies for the hang time.

jdl
