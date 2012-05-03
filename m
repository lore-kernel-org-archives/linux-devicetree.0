From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2 1/2] regulator: Add generic DT parsing for regulators
Date: Thu, 3 May 2012 16:29:42 -0700
Message-ID: <2C89F4165782854891CDE0F3198B753C14F5473BA2@HQMAIL01.nvidia.com>
References: <1335451941-26333-1-git-send-email-thierry.reding@avionic-design.de>
 <20120427180124.GQ18260@opensource.wolfsonmicro.com>,
 <4F9AE7C2.6010306@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4F9AE7C2.6010306-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/27/2012 11:38 AM, Stephen Warren wrote:
>On 04/27/2012 12:01 PM, Mark Brown wrote:
>> On Thu, Apr 26, 2012 at 04:52:20PM +0200, Thierry Reding wrote:
>>> Looking up init data for regulators found on chips is a common operation
>>> that can be handled in a generic way. The new helper function introduced
>>> by this patch looks up the children of a given node by names specified
>>> in a match table and fills that match table with information parsed from
>>> the DT.
>>>
>>> This is based on work by Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>.
>>
>> Rhyland, does this new interface work for you?
>
>I believe Rhyland is OOTO for the latter part of this week and perhaps
>some of next week too. (and he wasn't CC'd; I just added him)

Sorry for the delay.... Yes I think this patch looks like it will work for my purposes 
as well. 

-Rhyland
-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------
