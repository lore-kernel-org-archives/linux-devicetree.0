From: Tabi Timur-B04825 <B04825-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [RFC:PATCH dtc-1.3.0] dtc: Add --strip-disabled option to dtc.
Date: Fri, 17 Aug 2012 12:16:51 +0000
Message-ID: <502E3632.70208@freescale.com>
References: <1345034325-26656-1-git-send-email-srinivas.kandagatla@st.com>
 <20120817060415.GC29724@truffula.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120817060415.GC29724-W9XWwYn+TF0XU02nzanrWNbf9cGiqdzd@public.gmane.org>
Content-Language: en-US
Content-ID: <9C86A601991F044B8B3369E1C47B2EC7-725oAoX4OcF2GV6JINhBVAC/G2K4zDHf@public.gmane.org>
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
To: David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
Cc: "mmarek-AlSwsSmVLrQ@public.gmane.org" <mmarek-AlSwsSmVLrQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

David Gibson wrote:
> The name still isn't quite right - it doesn't just strip disabled
> nodes but anything that isn't "okay", OF defines "failed" at least as
> another possibility for the status property.

I would say that staus=failed in a DTS is an error.  It doesn't make any 
sense.  How can you know before you boot the board whether a device has 
failed?

-- 
Timur Tabi
Linux kernel developer at Freescale
