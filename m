From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [RFC][PATCH 2/2] powerpc/85xx: Introduce a P1020 SoC device tree
Date: Thu, 20 Oct 2011 15:56:09 -0500
Message-ID: <F31B0E37-BB2A-4C7A-8CB1-FCE55392A29B@kernel.crashing.org>
References: <1319095467-6229-1-git-send-email-galak@kernel.crashing.org>
 <1319095467-6229-2-git-send-email-galak@kernel.crashing.org>
 <CAOZdJXU4uHSTRD0vf2jS9gOzjVyO4BLn9=kEmLwwb72LhkTz=w@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAOZdJXU4uHSTRD0vf2jS9gOzjVyO4BLn9=kEmLwwb72LhkTz=w@mail.gmail.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Tabi Timur-B04825 <B04825-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org" <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Oct 20, 2011, at 11:28 AM, Tabi Timur-B04825 wrote:

> On Thu, Oct 20, 2011 at 2:24 AM, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
>> 
>>  arch/powerpc/boot/dts/p1020soc.dtsi |  262 +++++++++++++++++++++++++++++++++++
> 
> All of the other dtsi files are of the format "___si.dtsi".  Why does
> this one use "___soc.dtsi"?

I intend to also have a ___si.dtsi, still playing around with this so we have less overall duplication to support both 32 & 36-bit address maps as an example.

- k
