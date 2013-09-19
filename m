From: Junio C Hamano <gitster-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: git issue / [PATCH] MIPS: fix invalid symbolic link file
Date: Thu, 19 Sep 2013 09:37:41 -0700
Message-ID: <xmqqsix0u5re.fsf@gitster.dls.corp.google.com>
References: <1379596148-32520-1-git-send-email-maddy@linux.vnet.ibm.com>
	<20130919133920.GA22468@linux-mips.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130919133920.GA22468-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org> (Ralf Baechle's message
	of "Thu, 19 Sep 2013 15:39:20 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Cc: Madhavan Srinivasan <maddy-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, git-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, steven.hill-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, mmarek-AlSwsSmVLrQ@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org> writes:

>> diff --git a/arch/mips/boot/dts/include/dt-bindings b/arch/mips/boot/dts/include/dt-bindings
>> index 68ae388..08c00e4 120000
>> --- a/arch/mips/boot/dts/include/dt-bindings
>> +++ b/arch/mips/boot/dts/include/dt-bindings
>> @@ -1 +1 @@
>> -../../../../../include/dt-bindings
>> +../../../../../include/dt-bindings
>> \ No newline at end of file
>> -- 
>> 1.7.10.4
>
> I applied your patch - but now git-show shows it as an empty commit and
>
>   ls -lb arch/mips/boot/dts/include/dt-bindings
>
> still shows the \n at the end of the link target.
> ...
> So, I wonder if this is a git bug.

Sounds as if "git am" is losing the important bit of information
that new content ends with an incomplete line.

However, it does not reproduce for me.

    $ rm -fr /var/tmp/x && mkdir /var/tmp/x && cd /var/tmp/x
    $ git init
    $ ln -s 'a
    ' b
    $ git add b
    $ git commit -m initial
    $ ln -f -s a b
    $ git add b
    $ git commit -m fix
    $ git format-patch -1
    $ git checkout HEAD^
    $ git am 0001-*
    $ git diff HEAD^ HEAD
    diff --git a/b b/b
    index 7898192..2e65efe 120000
    --- a/b
    +++ b/b
    @@ -1 +1 @@
    -a
    +a
    \ No newline at end of file

I see the same with v1.7.10 (which may not match your version;
v1.7.10.4 is what was used by the patch submitter to prepare the
patch, and you did not say how you are applying the patches in your
message) and with more recent Git.  There is no such breakage.

I briefly suspected that you might be passing "--whitespace=fix" to
"am" and that may be incorrectly "fixing" the incomplete line, but
that is not the case.  I get the same result if I add the option to
"am" in the above transcript.

How are you applying the patch?  What is your Git version?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
