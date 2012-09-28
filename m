From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V3 2/2] dtc: cpp co-existence: add support for #line
 directives
Date: Fri, 28 Sep 2012 09:00:42 -0600
Message-ID: <5065BB9A.40106@wwwdotorg.org>
References: <1348787465-9745-1-git-send-email-swarren@wwwdotorg.org>
 <1348787465-9745-2-git-send-email-swarren@wwwdotorg.org>
 <20120928000807.GD24942@truffula.fritz.box> <E1THbVW-0005d1-0V@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <E1THbVW-0005d1-0V-CYoMK+44s/E@public.gmane.org>
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
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/28/2012 08:25 AM, Jon Loeliger wrote:
>> On Thu, Sep 27, 2012 at 05:11:05PM -0600, Stephen Warren wrote:
>>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>
>>> Line control directives of the following formats are supported:
>>>     #line LINE "FILE"
>>>     # LINE "FILE" [FLAGS]
>>>
>>> This allows dtc to consume the output of pre-processors, and to provide
>>> error messages that refer to the original filename, including taking
>>> into account any #include directives that the pre-processor may have
>>> performed.
>>>
>>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Acked-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
>>
>> Jon, please apply.
> 
> Both 1/2 and 2/2 applied and pushed out.

Excellent. Thank you very much Jon and David.
