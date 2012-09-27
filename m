From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 2/2] dtc: cpp co-existence: add support for #line
 directives
Date: Thu, 27 Sep 2012 09:53:01 -0600
Message-ID: <5064765D.7090005@wwwdotorg.org>
References: <1348676285-1777-1-git-send-email-swarren@wwwdotorg.org>
 <1348676285-1777-2-git-send-email-swarren@wwwdotorg.org>
 <20120927070746.GL31993@truffula.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120927070746.GL31993-W9XWwYn+TF0XU02nzanrWNbf9cGiqdzd@public.gmane.org>
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
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/27/2012 01:07 AM, David Gibson wrote:
> On Wed, Sep 26, 2012 at 10:18:05AM -0600, Stephen Warren wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Line control directives of the following formats are supported:
>>     #line LINE "FILE"
>>     # LINE "FILE" [FLAGS]
>>
>> This allows dtc to consume the output of pre-processors, and to provide
>> error messages that refer to the original filename, including taking
>> into account any #include directives that the pre-processor may have
>> performed.
>>
>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Nice.  Two small changes I'd like to see:
> 
>> +<*>^"#"(line{WS}|" "){WS}*[0-9]+{WS}+{STRING}({WS}+[0-9]+)? {
> 
> I think this can be done slightly more cleanly as:
> ^"#"(line)?{WS}+[0-9]+{WS}+{STRING}({WS}+[0-9]+)?

Did you mean to ommit the <*> from the beginning there? I'm not sure
what the difference is between no start state tag and what I assume is a
wildcard tag.

Other than that, it looks like that should work; I'll try it out.
