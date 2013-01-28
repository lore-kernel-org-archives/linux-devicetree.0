From: Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] Move the fdt*_t type definitions to fdt.h
Date: Mon, 28 Jan 2013 08:29:03 -0500
Message-ID: <51067D1F.1000306@cideas.com>
References: <5105E615.30102@cideas.com>
 <20130128045233.GA4107@truffula.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130128045233.GA4107-W9XWwYn+TF0XU02nzanrWNbf9cGiqdzd@public.gmane.org>
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
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/27/2013 11:52 PM, David Gibson wrote:
> On Sun, Jan 27, 2013 at 09:44:37PM -0500, Gerald Van Baren wrote:
>> Arguably they belong there since they are fundamental to the fdt.
>> As a side effect, I had to flip the order of #includes of fdt.h and
>> libfdt_env.h in libfdt.h since libfdt_env.h needs the fdt*_t definitions.
>>
>> Signed-off-by: Gerald Van Baren <gvb-LFPmMGy0VdYAvxtiuMwx3w@public.gmane.org>
>> ---
>>
>> I'm not sure I like this, but submit it for your consideration.  If, for
>> some reason, libfdt_env.h needed to (re)define something in fdt.h, it
>> would be unable to do so. :-/
>
> Sorry, nack on this one.  fdt.h is supposed to be as independent as we
> can make it from the environment in which its being compiled.  That
> means I don't want it to include *any* system headers, even stdint.h.

No problem, it didn't feel right to me either.  Thank you for your 
consideration. :-)

Best regards,
gvb
