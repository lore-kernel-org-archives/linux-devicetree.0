From: Lukasz Wojcik <zbr-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
Subject: Re: Use yylloc instead of yyloc
Date: Fri, 13 Nov 2009 14:10:46 +0100
Message-ID: <4AFD5AD6.6060906@semihalf.com>
References: <20091112001404.GI3235@yookeroo.seuss> <E1N8QaJ-00031X-GU@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <E1N8QaJ-00031X-GU-CYoMK+44s/E@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Jon Loeliger wrote:
>> Jon, fix for the typo the FreeBSD folks noticed.  Please apply.
>>
>> yylloc is the correct way to get token positioning information.  yyloc
>> is a bison internal variable that only works by accident.
>>
>> Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
>>
>> Index: dtc/dtc-parser.y
>> ===================================================================
>> --- dtc.orig/dtc-parser.y	2009-11-12 11:11:15.000000000 +1100
>> +++ dtc/dtc-parser.y	2009-11-12 11:11:20.000000000 +1100
>> @@ -175,7 +175,7 @@ propdata:
>>  
>>  			if ($6 != 0)
>>  				if (fseek(file->file, $6, SEEK_SET) != 0)
>> -					srcpos_error(&yyloc,
>> +					srcpos_error(&yylloc,
>>  						     "Couldn't seek to offset %
>> llu in \"%s\": %s",
>>  						     (unsigned long long)$6,
>>  						     $4.val,
>>
>>
>>     
>
> Applied.
>
> jdl
>   
Thanks a lot for your quick fix. I have one observation to share though:
After applying newest fix, i did the tests around incbin feature. I have
modified original incbin.dts (from ./tests/ subdir) as follows :

---diff---
5c5
<     incbin-partial = /incbin/("incbin.bin", 0xfffffffffffffff, 
0xffffffffffffffff);
---
 >     incbin-partial = /incbin/("incbin.bin", 13, 17);

---eofdiff---

Trying to run following command:

./dtc -O dtb -o incbin.dtb -b 0 -p 1024 incbin.dts

..produces output:

Error: incbin.dts 5:1 - 1:1 Couldn't seek to offset 1152921504606846975 
in "incbin.bin": Invalid argument

I'm just wondering where exactly does location 5:1 - 1:1 point. It seems to
be a bit unclear. Wouldn't it be enough to just specify line number ? Thanks
again.

Lukasz.
