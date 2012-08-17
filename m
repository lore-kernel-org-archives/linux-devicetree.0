From: Srinivas KANDAGATLA <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Subject: Re: [RFC:PATCH dtc-1.3.0] dtc: Add --strip-disabled option to dtc.
Date: Fri, 17 Aug 2012 15:19:31 +0100
Message-ID: <502E52F3.7090404@st.com>
References: <1345034325-26656-1-git-send-email-srinivas.kandagatla@st.com>
 <20120817060415.GC29724@truffula.fritz.box> <502E3632.70208@freescale.com>
Reply-To: srinivas.kandagatla-qxv4g6HH51o@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <502E3632.70208-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
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
To: Tabi Timur-B04825 <B04825-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "mmarek-AlSwsSmVLrQ@public.gmane.org" <mmarek-AlSwsSmVLrQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 17/08/12 13:16, Tabi Timur-B04825 wrote:
> David Gibson wrote:
>> The name still isn't quite right - it doesn't just strip disabled
>> nodes but anything that isn't "okay", OF defines "failed" at least as
>> another possibility for the status property.
> I would say that staus=failed in a DTS is an error.  It doesn't make any 
> sense.  How can you know before you boot the board whether a device has 
> failed?

If you know in advance that device on that SOC is broken, then I guess
"Fail"/"Failed" can be used in status property.

One user of this flag in kernel device trees is
./arch/powerpc/boot/dts/mpc8313erdb.dts
