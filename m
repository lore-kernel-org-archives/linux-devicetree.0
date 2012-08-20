From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [RFC:PATCH dtc-1.3.0] dtc: Add --strip-disabled option to dtc.
Date: Mon, 20 Aug 2012 10:59:16 -0500
Message-ID: <50325ED4.2070403@freescale.com>
References: <1345034325-26656-1-git-send-email-srinivas.kandagatla@st.com>
 <20120817060415.GC29724@truffula.fritz.box> <502E3632.70208@freescale.com>
 <502E52F3.7090404@st.com> <502E64F9.2020400@freescale.com>
 <5031F706.3050509@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <5031F706.3050509-qxv4g6HH51o@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: srinivas.kandagatla-qxv4g6HH51o@public.gmane.org
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "mmarek-AlSwsSmVLrQ@public.gmane.org" <mmarek-AlSwsSmVLrQ@public.gmane.org>, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/20/2012 03:36 AM, Srinivas KANDAGATLA wrote:
> On 17/08/12 16:36, Timur Tabi wrote:
>> Srinivas KANDAGATLA wrote:
>>> If you know in advance that device on that SOC is broken, then I guess
>>> "Fail"/"Failed" can be used in status property.
>>>
>>> One user of this flag in kernel device trees is
>>> ./arch/powerpc/boot/dts/mpc8313erdb.dts
>> 	/* Remove this (or change to "okay") if you have
>> 	 * a REVA3 or later board, if you apply one of the
>> 	 * workarounds listed in section 8.5 of the board
>> 	 * manual, or if you are adapting this device tree
>> 	 * to a different board.
>> 	 */
>> 	status = "fail";
>>
>> I'm not sure this is the right way to do it. 
> I agree, the way fail status is used is pretty much redundant to what
> "disabled" is used for.
> I think the device trees files should have status as "okay" or "ok" or
> "disabled" or skip status property totally.

The distinction between "disabled" and "fail" is useful when the OS
knows how to enable a node (e.g. by manipulating muxing).

-Scott
