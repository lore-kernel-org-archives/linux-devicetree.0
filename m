From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [RFC][PATCH 1/2] powerpc/85xx: create dts components to build up
 an SoC
Date: Thu, 20 Oct 2011 22:03:26 -0500
Message-ID: <06FA8EE7-85F8-42C6-A030-08E0A32763CB@kernel.crashing.org>
References: <1319095467-6229-1-git-send-email-galak@kernel.crashing.org>
 <CAOZdJXWtnBB5=DahG8LGQpeP7or0VZv78duhtPiORk3WOir8gQ@mail.gmail.com>
 <A54F7698-A96F-4EE1-89DB-B6A7C5A071FB@kernel.crashing.org>
 <4EA08D20.7010405@freescale.com>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4EA08D20.7010405-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org" <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Oct 20, 2011, at 4:05 PM, Timur Tabi wrote:

> Kumar Gala wrote:
>>>> How about we put all serial devices into one pq3-duart.dtsi file, and
>>>> let the parent dtsi file reference just the ones that it needs?
>> there isn't an option to do that w/dtc
> 
> What about making all the nodes disabled by default, and then the soc.dtsi
> or si.dtsi file can re-enable them?

Its still a bit problematic in that I don't want nodes to exist that aren't in the SoC.

- k
