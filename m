From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCH V3 2/3] regulator: dt: regulator match by
 regulator-compatible
Date: Thu, 21 Jun 2012 11:53:41 -1000
Message-ID: <4FE397E5.1070707@firmworks.com>
References: <1340194987-23654-1-git-send-email-ldewangan@nvidia.com>
 <201206211450.35713.arnd@arndb.de>
 <20120621161459.GY4037@opensource.wolfsonmicro.com>
 <201206211717.46142.arnd@arndb.de>
 <20120621194544.GZ4037@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0055521992608488652=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120621194544.GZ4037-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
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
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lrg-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is a multi-part message in MIME format.
--===============0055521992608488652==
Content-Type: multipart/alternative;
 boundary="------------010402090608010900090204"

This is a multi-part message in MIME format.
--------------010402090608010900090204
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 6/21/2012 9:45 AM, Mark Brown wrote:
> On Thu, Jun 21, 2012 at 05:17:45PM +0000, Arnd Bergmann wrote:
>> On Thursday 21 June 2012, Mark Brown wrote:
>
>>> I'm not that big a fan of moving all the data into device tree as it
>>> means that you need even more parsing code and you need to update the
>>> device trees for every board out there every time you want to add
>>> support for a new feature which doesn't seem like a win.


Maybe I'm missing something, but in general it's not necessary to update 
old device
trees to support new features.  The trick is to define a new property 
that describes
the new possibility.  Absence of that property implies that the default 
- the thing
that used to happen across the board, before the feature existed - applies.

>>>   Right now with
>>> the DT kept in the kernel it's not so bad but if we ever do start
>>> distributing it separately it becomes more of an issue.
>
>> Right. It's certainly a trade-off. If a company makes 100 SoCs that
>> all have similar-but-different regulators, then it should be clear
>> win to have the driver be very abstract and fed with DT data for
>> configuragtion.
>
> Well, nobody does that anyway but even if they were it doesn't help
> non-DT systems at all, nor does it help when we need to go and add new
> properties to every existing device tree using the device.  We've got
> far more architectures don't use DT than do...
>
>>> I'm also not sure if the tooling works well for allowing people to
>>> include standard DTs for chips and add new properties to nodes for the
>>> board specific configuration, though I think I've seen a few things
>>> which suggested that was dealt with reasonably well.
>
>> It should never be necessary to add board-specific properties in the
>> nodes that describe the SoC specific bits. What I was referring to
>> is just moving the data that currently resides in the regulator
>> driver into DT.
>
> How would this work given that we also need to put system specific
> configuration for the same devices into DT?  As Stephen says it doesn't
> seem to match what we're currently doing.
>
>
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss


--------------010402090608010900090204
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix"><tt>On 6/21/2012 9:45 AM, Mark Brown
        wrote:<br>
      </tt></div>
    <blockquote
      cite="mid:20120621194544.GZ4037-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org"
      type="cite">
      <pre wrap=""><tt>On Thu, Jun 21, 2012 at 05:17:45PM +0000, Arnd Bergmann wrote:
</tt></pre>
      <blockquote type="cite">
        <pre wrap=""><tt>On Thursday 21 June 2012, Mark Brown wrote:
</tt></pre>
      </blockquote>
      <pre wrap=""><tt>
</tt></pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap=""><tt>I'm not that big a fan of moving all the data into device tree as it
means that you need even more parsing code and you need to update the
device trees for every board out there every time you want to add
support for a new feature which doesn't seem like a win. </tt></pre>
        </blockquote>
      </blockquote>
    </blockquote>
    <br>
    <br>
    Maybe I'm missing something, but in general it's not necessary to
    update old device<br>
    trees to support new features.&nbsp; The trick is to define a new
    property that describes<br>
    the new possibility.&nbsp; Absence of that property implies that the
    default - the thing<br>
    that used to happen across the board, before the feature existed -
    applies.<br>
    <br>
    <blockquote
      cite="mid:20120621194544.GZ4037-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org"
      type="cite">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap=""><tt> Right now with
the DT kept in the kernel it's not so bad but if we ever do start
distributing it separately it becomes more of an issue.
</tt></pre>
        </blockquote>
      </blockquote>
      <pre wrap=""><tt>
</tt></pre>
      <blockquote type="cite">
        <pre wrap=""><tt>Right. It's certainly a trade-off. If a company makes 100 SoCs that
all have similar-but-different regulators, then it should be clear
win to have the driver be very abstract and fed with DT data for
configuragtion.
</tt></pre>
      </blockquote>
      <pre wrap=""><tt>
Well, nobody does that anyway but even if they were it doesn't help
non-DT systems at all, nor does it help when we need to go and add new
properties to every existing device tree using the device.  We've got
far more architectures don't use DT than do...

</tt></pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap=""><tt>I'm also not sure if the tooling works well for allowing people to
include standard DTs for chips and add new properties to nodes for the
board specific configuration, though I think I've seen a few things
which suggested that was dealt with reasonably well.
</tt></pre>
        </blockquote>
      </blockquote>
      <pre wrap=""><tt>
</tt></pre>
      <blockquote type="cite">
        <pre wrap=""><tt>It should never be necessary to add board-specific properties in the
nodes that describe the SoC specific bits. What I was referring to
is just moving the data that currently resides in the regulator
driver into DT.
</tt></pre>
      </blockquote>
      <pre wrap=""><tt>
How would this work given that we also need to put system specific
configuration for the same devices into DT?  As Stephen says it doesn't
seem to match what we're currently doing.
</tt></pre>
      <tt><br>
      </tt>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <tt><br>
      </tt>
      <pre wrap=""><tt>_______________________________________________
devicetree-discuss mailing list
<a class="moz-txt-link-abbreviated" href="mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org">devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org</a>
<a class="moz-txt-link-freetext" href="https://lists.ozlabs.org/listinfo/devicetree-discuss">https://lists.ozlabs.org/listinfo/devicetree-discuss</a>
</tt></pre>
    </blockquote>
    <tt><br>
    </tt>
  </body>
</html>

--------------010402090608010900090204--

--===============0055521992608488652==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0055521992608488652==--
