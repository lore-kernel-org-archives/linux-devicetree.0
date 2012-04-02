From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2] dtc: Basic integer expressions
Date: Mon, 02 Apr 2012 10:16:27 -0600
Message-ID: <4F79D0DB.9010500@wwwdotorg.org>
References: <1332901483-3751-1-git-send-email-swarren@wwwdotorg.org>
 <E1SDzDw-0003C1-Ag@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <E1SDzDw-0003C1-Ag-CYoMK+44s/E@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 03/31/2012 08:24 AM, Jon Loeliger wrote:
>> Written by David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>. Additions by me:
>> * Ported to ToT dtc.
>> * Renamed cell to integer throughout.
>> * Implemented value range checks.
>> * Allow L/UL/LL/ULL suffix on literals.
>> * Enabled the commented test.
>>
>> Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
>> ---
>> v2:
>> * s/cell/integer/ throughout.
>> * Allow signed-extended values to pass the overall cell range check.
>> * Allow L/UL/LL/ULL suffix on literals. This is purely for compatibility
>>   with C, and has no effect on dtc's processing.
>> * Enabled the 3 disabled tests.
>>
>> I'm not sure if the literal suffix handling is hacky or not...
> 
> I get this too:
> 
>  CC tests/integer-expressions.o
> cc1: warnings being treated as errors
> tests/integer-expressions.c: In function 'main'
> tests/integer-expressions.c:105: error: format  tests/integer-expressions.o
> cc1: warnings being treated as errors
> tests/integer-expressions.c:105: error: format '%ld' expects type 'long int', but argument 3 has type 'unsigned int'
> make: *** [tests/integer-expressions.o] Error 1
> 
> $ gcc --version
> gcc (Debian 4.4.5-8) 4.4.5

I assume this is a 32-bit system? I guess I can use <inttypes.h> to
solve this if needed.
