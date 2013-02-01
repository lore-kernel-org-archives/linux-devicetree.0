From: Srinivas KANDAGATLA <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH V7] kbuild: create a rule to run the pre-processor on
 *.dts files
Date: Fri, 01 Feb 2013 19:22:59 +0000
Message-ID: <510C1613.6080601@st.com>
References: <1357152215-5845-1-git-send-email-swarren@wwwdotorg.org>
 <510B8480.7000507@st.com> <510BF281.1080309@gmail.com>
Reply-To: srinivas.kandagatla-qxv4g6HH51o@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1947352089663260767=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <510BF281.1080309-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Michal Marek <mmarek-AlSwsSmVLrQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is a multi-part message in MIME format.
--===============1947352089663260767==
Content-Type: multipart/alternative;
 boundary="------------090407070401030701010001"

This is a multi-part message in MIME format.
--------------090407070401030701010001
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 01/02/13 16:51, Rob Herring wrote:
> On 02/01/2013 03:01 AM, Srinivas KANDAGATLA wrote:
>> Hi Stephen,
>> Not sure if you have already noticed this but,
>> I did try this patch on my 3.8, and it looks like the intermediate dts
>> file replaces all instances of linux with 1 because of predefined macros
>> in gcc.
>> As a result
>>     linux,stdout-path = "/soc/stm-asc2";
>> is changed to.
>>     1,stdout-path = "/soc/stm-asc2";
>>
>> On my version of compiler(gcc version 4.6.3) I have
>>
>> armv7-linux-gcc -E -dM - < /dev/null | grep -v _
>> #define unix 1
>> #define linux 1
>>
>> Which might be true with most compiler versions aswell.
>> As we are using linux as prefix for some device tree properties it makes
>> sense to undef the linux gcc define.
>> Adding -Ulinux to cmd_dtc_cpp should fix it.
>>
>> -cmd_dtc_cpp = $(CPP) $(cpp_flags) -D__DTS__ -x assembler-with-cpp -o
>> $(dtc-tmp) $< ; \
>> +cmd_dtc_cpp = $(CPP) $(cpp_flags) -D__DTS__  -Ulinux -x
>> assembler-with-cpp -o $(dtc-tmp) $< ; \
>>     $(objtree)/scripts/dtc/dtc -O dtb -o $@ -b 0 $(DTC_FLAGS) $(dtc-tmp)
> That's a hackish solution that seems fragile as well. Is there no way to
> turn off all built-in defines?
Yes, there is another option to turn of system-specific options and keep
macros like __ASSEMBLER__

|-undef||(|Do not predefine any system-specific or GCC-specific macros.
The standard predefined macros remain defined. See Standard Predefined
Macros
<http://gcc.gnu.org/onlinedocs/cpp/Standard-Predefined-Macros.html#Standard-Predefined-Macros>.)
This option also worked for me.

--srini



>
> Rob
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
>


--------------090407070401030701010001
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    On 01/02/13 16:51, Rob Herring wrote:
    <blockquote cite="mid:510BF281.1080309-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" type="cite">
      <pre wrap="">On 02/01/2013 03:01 AM, Srinivas KANDAGATLA wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">Hi Stephen,
Not sure if you have already noticed this but,
I did try this patch on my 3.8, and it looks like the intermediate dts
file replaces all instances of linux with 1 because of predefined macros
in gcc.
As a result
    linux,stdout-path = "/soc/stm-asc2";
is changed to.
    1,stdout-path = "/soc/stm-asc2";

On my version of compiler(gcc version 4.6.3) I have

armv7-linux-gcc -E -dM - &lt; /dev/null | grep -v _
#define unix 1
#define linux 1

Which might be true with most compiler versions aswell.
As we are using linux as prefix for some device tree properties it makes
sense to undef the linux gcc define.
Adding -Ulinux to cmd_dtc_cpp should fix it.

-cmd_dtc_cpp = $(CPP) $(cpp_flags) -D__DTS__ -x assembler-with-cpp -o
$(dtc-tmp) $&lt; ; \
+cmd_dtc_cpp = $(CPP) $(cpp_flags) -D__DTS__  -Ulinux -x
assembler-with-cpp -o $(dtc-tmp) $&lt; ; \
    $(objtree)/scripts/dtc/dtc -O dtb -o $@ -b 0 $(DTC_FLAGS) $(dtc-tmp)
</pre>
      </blockquote>
      <pre wrap="">
That's a hackish solution that seems fragile as well. Is there no way to
turn off all built-in defines?</pre>
    </blockquote>
    <tt>Yes, there is another option </tt><tt>to turn of
      system-specific options and keep macros like __ASSEMBLER__<br>
    </tt>
    <dl>
      <dt><tt><code>-undef</code></tt><tt><code> (</code>Do not
          predefine any system-specific or GCC-specific macros. The
          standard predefined macros remain defined. See <a
href="http://gcc.gnu.org/onlinedocs/cpp/Standard-Predefined-Macros.html#Standard-Predefined-Macros">Standard
            Predefined Macros</a>.)</tt></dt>
      <dt><tt>This option also worked for me.</tt></dt>
      <dt><br>
      </dt>
      <dt><tt>--srini<br>
        </tt></dt>
      <dd><br>
      </dd>
      <dd><br>
      </dd>
    </dl>
    <br>
    <blockquote cite="mid:510BF281.1080309-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" type="cite">
      <pre wrap="">

Rob
_______________________________________________
devicetree-discuss mailing list
<a class="moz-txt-link-abbreviated" href="mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org">devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org</a>
<a class="moz-txt-link-freetext" href="https://lists.ozlabs.org/listinfo/devicetree-discuss">https://lists.ozlabs.org/listinfo/devicetree-discuss</a>

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------090407070401030701010001--

--===============1947352089663260767==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1947352089663260767==--
