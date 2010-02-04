From: Lukasz Wojcik <zbr-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] Modification of lexer and parser,
	improving dtc portability.
Date: Thu, 04 Feb 2010 10:42:27 +0100
Message-ID: <4B6A9683.300@semihalf.com>
References: <1264782711-52086-1-git-send-email-zbr@semihalf.com>
	<20100201044601.GA8095@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100201044601.GA8095@yookeroo>
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
Cc: Devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01.02.2010 05:46, David Gibson wrote:
> On Fri, Jan 29, 2010 at 05:31:51PM +0100, Lukasz Wojcik wrote:
>    
>> This mod allows successful build of dtc using both bison/flex and
>> yacc/lex.
>>      
> Hrm.  This will enable dtc to build with both bison and yacc, however,
> it will sacrifice the (much) more useful error messages that
> %locations gives us on bison.  So I'm not very happy to do this
> unconditionally.
>
>    
Would you be so kind, and possibly point me out where exactly the 
differences
between error messages before and after applying this patch lies ? I did 
some
testing around dtc being compiled using:

yacc - 1.9 20070509 on Fedora, kernel 2.6.31.5-127.fc12.i686.PAE
and
bison (GNU Bison) 2.4.1, same system.

I was not able to notice any difference. Thanks in advance.

Lukasz.
