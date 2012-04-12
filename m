From: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] dtc: Remove spurious output on stderr
Date: Wed, 11 Apr 2012 18:19:59 -0700
Message-ID: <4F862DBF.7030502@gmail.com>
References: <1334170516-23473-1-git-send-email-sjg@chromium.org>
 <1334187146-8384-1-git-send-email-sjg@chromium.org>
 <20120411233459.GC8024@truffala.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120411233459.GC8024-MK4v0fQdeXQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/11/2012 04:34 PM, David Gibson wrote:
> On Wed, Apr 11, 2012 at 04:32:26PM -0700, Simon Glass wrote:
>> Outputing to stderr is best avoided unless there is an error or warning to
>> display. At present dtc always displays the name of the file it is compiling
>> and the input/output formats. For example:
>>
>> DTC: dts->dts  on file "-"
>>
>> This can cause problems in some build systems. For example, U-Boot shows
>> build errors for any boards which use dtc at present. It is typically the
>> only message output during such a build. The C compiler does not output
>> anything in general. The current dtc behaviour makes it difficult to
>> provide a silent build in the normal case where nothing went wrong.
>>
>> Remove the message entirely.
>>
>> Signed-off-by: Simon Glass<sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>
> Acked-by: David Gibson<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
>

I agree, I just saw two of them not 30 seconds ago.  So FWIW:

Acked-by: Signed-off-by: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
