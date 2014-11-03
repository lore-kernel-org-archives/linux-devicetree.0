From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 1/1] ARM: at91/dt: sam9x5: Add CAN device nodes
Date: Mon, 3 Nov 2014 11:32:34 +0100
Message-ID: <545759C2.3050706@atmel.com>
References: <1412682710-14219-1-git-send-email-alexander.stein@systec-electronic.com> <544692A6.9030509@atmel.com> <1963737.sgbgq0RFOC@ws-stein>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1963737.sgbgq0RFOC@ws-stein>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 28/10/2014 09:27, Alexander Stein :
> Hello Nicolas,
> 
> On Tuesday 21 October 2014 19:06:46, Nicolas Ferre wrote:
>> On 07/10/2014 13:51, Alexander Stein :
>>> Add the missing CAN devices node including their pin muxing to the shared
>>> .dtsi for at91sam9x5. Actually include this file.
>>> While at it, fix white spaces of can1_clk.
>>
>> Well, no: I split the patch in two to separate these whitespace
>> modifications and the addition of nodes. But now worries, I did it and
>> stacked the 2 patches on top of my WIP at91-3.19-dt branch.
> 
> It seems this branch is not public, yet. At least I could not find it on git.kernel.org.

It is now:


> Did you also pick "ARM: at91/dt: sam9263: Add CAN device nodes"? (https://www.mail-archive.com/devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg44970.html)

I've just done it. Thanks for the "heads-up" ;-)

Bye,
-- 
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
