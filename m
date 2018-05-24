From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH RFC 05/24] Revert "drm: Nerf the preclose callback for
 modern drivers"
Date: Thu, 24 May 2018 08:46:15 +0200
Message-ID: <75f682e9-5b31-ad82-441f-b2c250edc0a0@amd.com>
References: <20180518092815.25280-1-yuq825@gmail.com>
 <20180518092815.25280-6-yuq825@gmail.com>
 <9b48f845-9854-1029-ed21-df7b3590935b@gmail.com>
 <CAKGbVbuSuAEF9Zd_usM5ika5KuFiY75jCG3gwOfeAExSciRV7Q@mail.gmail.com>
 <c958599c-b0df-8b85-4123-daeed0fb07ac@amd.com>
 <CAKGbVbv10zGLe34J1BXdKHg1Kg0=7A3jUy_8pnjVjNs1T=r8mw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1319906312=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAKGbVbv10zGLe34J1BXdKHg1Kg0=7A3jUy_8pnjVjNs1T=r8mw@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Qiang Yu <yuq825@gmail.com>
Cc: Simon Shields <simon@lineageos.org>, devicetree@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>, Marek Vasut <marex@denx.de>, Neil Armstrong <narmstrong@baylibre.com>, Andrei Paulau <7134956@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>, Vasily Khoruzhick <anarsoul@gmail.com>, Erico Nunes <nunes.erico@gmail.com>
List-Id: devicetree@vger.kernel.org

This is a multi-part message in MIME format.
--===============1319906312==
Content-Type: multipart/alternative;
 boundary="------------F43F41783AC1044353216ACC"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------F43F41783AC1044353216ACC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 24.05.2018 um 03:38 schrieb Qiang Yu:
> [SNIP]
>>> Adding fence is done already, and I did wait it before unmap. But then
>>> I see when
>>> the buffer is shared between processes, the "perfect wait" is just
>>> wait the fence
>>> from this process's task, so it's better to also distinguish fences.
>>> If so, I just think
>>> why we don't just wait tasks from this process in the preclose before
>>> unmap/free
>>> buffer in the drm_release()?
>>
>> Well it depends on your VM management. When userspace expects that the VM
>> space the BO used is reusable immediately than the TTM callback won't work.
>>
>> On the other hand you can just grab the list of fences on a BO and filter
>> out the ones from your current process and wait for those. See
>> amdgpu_sync_resv() as an example how to do that.
> In current lima implementation, user space driver is responsible not unmap/free
> buffer before task is complete. And VM map/unmap is not differed.

Well it's up to you how to design userspace, but in the past doing it 
like that turned out to be a rather bad design decision.

Keep in mind that the kernel driver must guarantee that a shaders can 
never access freed up memory.

Otherwise taking over the system from an unprivileged processes becomes 
just a typing exercise when you manage to access freed memory which is 
now used for a page table.

Because of this we have a separate tracking in amdgpu so that we not 
only know who is using which BO, who is using which VM.

> This works simple and fine except the case that user press Ctrl+C to terminate
> the application which will force to close drm fd.

I'm not sure if that actually works as fine as you think.

For an example of what we had to add to prevent security breaches, take 
a look at amdgpu_gem_object_close().

> I'd more prefer to wait buffer fence before vm unmap and filter like
> amdgpu_sync_resv() compared to implement refcount in kernel task.
> But these two ways are all not as simple as preclose.

Well, I would rather say you should either delay VM unmap operations 
until all users of the VM are done with their work using the 
ttm_bo_destroy callback.

Or you block in the gem_close_object callback until all tasks using the 
BO are done with it.

> So I still don't understand why you don't want to get preclose back even
> have to introduce other complicated mechanism to cover the case free/unmap
> buffer before this process's task is done?

We intentionally removed the preclose callback to prevent certain use 
cases, bringing it back to allow your use case looks rather fishy to me.

BTW: What exactly is the issue with using the postclose callback?

Regards,
Christian.

>
> Regards,
> Qiang
>


--------------F43F41783AC1044353216ACC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">Am 24.05.2018 um 03:38 schrieb Qiang
      Yu:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAKGbVbv10zGLe34J1BXdKHg1Kg0=7A3jUy_8pnjVjNs1T=r8mw@mail.gmail.com">[SNIP]
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="">Adding fence is done already, and I did wait it before unmap. But then
I see when
the buffer is shared between processes, the "perfect wait" is just
wait the fence
from this process's task, so it's better to also distinguish fences.
If so, I just think
why we don't just wait tasks from this process in the preclose before
unmap/free
buffer in the drm_release()?
</pre>
        </blockquote>
        <pre wrap="">

Well it depends on your VM management. When userspace expects that the VM
space the BO used is reusable immediately than the TTM callback won't work.

On the other hand you can just grab the list of fences on a BO and filter
out the ones from your current process and wait for those. See
amdgpu_sync_resv() as an example how to do that.
</pre>
      </blockquote>
      <pre wrap="">
In current lima implementation, user space driver is responsible not unmap/free
buffer before task is complete. And VM map/unmap is not differed.</pre>
    </blockquote>
    <br>
    Well it's up to you how to design userspace, but in the past doing
    it like that turned out to be a rather bad design decision.<br>
    <br>
    Keep in mind that the kernel driver must guarantee that a shaders
    can never access freed up memory.<br>
    <br>
    Otherwise taking over the system from an unprivileged processes
    becomes just a typing exercise when you manage to access freed
    memory which is now used for a page table.<br>
    <br>
    Because of this we have a separate tracking in amdgpu so that we not
    only know who is using which BO, who is using which VM.<br>
    <br>
    <blockquote type="cite"
cite="mid:CAKGbVbv10zGLe34J1BXdKHg1Kg0=7A3jUy_8pnjVjNs1T=r8mw@mail.gmail.com">
      <pre wrap="">This works simple and fine except the case that user press Ctrl+C to terminate
the application which will force to close drm fd.</pre>
    </blockquote>
    <br>
    I'm not sure if that actually works as fine as you think.<br>
    <br>
    For an example of what we had to add to prevent security breaches,
    take a look at <span class="pl-en">amdgpu_gem_object_close().</span><br>
    <br>
    <blockquote type="cite"
cite="mid:CAKGbVbv10zGLe34J1BXdKHg1Kg0=7A3jUy_8pnjVjNs1T=r8mw@mail.gmail.com">
      <pre wrap="">I'd more prefer to wait buffer fence before vm unmap and filter like
amdgpu_sync_resv() compared to implement refcount in kernel task.
But these two ways are all not as simple as preclose.</pre>
    </blockquote>
    <br>
    Well, I would rather say you should either delay VM unmap operations
    until all users of the VM are done with their work using the
    ttm_bo_destroy callback.<br>
    <br>
    Or you block in the <span class="pl-en">gem_close_object callback
      until all tasks using the BO are done with it.</span><br>
    <br>
    <blockquote type="cite"
cite="mid:CAKGbVbv10zGLe34J1BXdKHg1Kg0=7A3jUy_8pnjVjNs1T=r8mw@mail.gmail.com">
      <pre wrap="">So I still don't understand why you don't want to get preclose back even
have to introduce other complicated mechanism to cover the case free/unmap
buffer before this process's task is done?</pre>
    </blockquote>
    <br>
    We intentionally removed the preclose callback to prevent certain
    use cases, bringing it back to allow your use case looks rather
    fishy to me.<br>
    <br>
    BTW: What exactly is the issue with using the postclose callback?<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite"
cite="mid:CAKGbVbv10zGLe34J1BXdKHg1Kg0=7A3jUy_8pnjVjNs1T=r8mw@mail.gmail.com">
      <pre wrap="">

Regards,
Qiang

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------F43F41783AC1044353216ACC--

--===============1319906312==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1319906312==--
