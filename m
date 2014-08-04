From: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 5/6] ARM: DTS: da850-evm: Add node for tlv320aic3106 codec
Date: Mon, 4 Aug 2014 12:09:56 +0300
Message-ID: <53DF4DE4.3090305@ti.com>
References: <1406801934-23334-1-git-send-email-peter.ujfalusi@ti.com>	<1406801934-23334-6-git-send-email-peter.ujfalusi@ti.com>	<53DA519A.4090905@cogentembedded.com>
	<53DB240F.2030908@ti.com>	<53DB8CEA.9010902@cogentembedded.com>
	<53DB8FE1.5010207@ti.com>	<53DB9292.7080008@cogentembedded.com>
	<53DB9751.6030508@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <53DB9751.6030508-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, nsekhar-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, khilman-1D3HCaltpLuhEniVeURVKkEOCMrvLtNR@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/01/2014 04:34 PM, Peter Ujfalusi wrote:
> Hi,
> =

> On 08/01/2014 04:13 PM, Sergei Shtylyov wrote:
>> Hello.
>>
>> On 08/01/2014 05:02 PM, Peter Ujfalusi wrote:
>>
>>>>     I do. We should follow the standard consistently. Why not call the=
 node
>>>> "sound-codec"?
>>
>>> Well, there is _zero_ cases when the audio codec node is named as
>>> "sound-codec" in linux-next but we have wmXXXX, tlvXXXX, twlXXXX, maxXX=
XX etc.
>>
>>    Which only means people don't read the standard (which is referred to=
 on
>> http://www.devicetree.org/Device_Tree_Usage, that says the same).
>>
>>> Yeah, there are few DTS files which have codec as node name.
>>> So, no, I'm not going to change the node name from tlv320aic3106.
>>
>>    So you prefer following the bad examples to following the standard?
> =

> those bad examples are in the tree and they did went through the review
> process (arch, DT and probably alsa). But it is interesting that we do not
> have a single correct node name for audio codecs (probably for other type=
s also).

I have thought about this over the weekend and I would keep the node name f=
or
the codec as it is in the patch.
It is the common practice for audio and it also helps when reading the DT f=
ile
to quickly see the audio support on the board. We all use the 'sound' node
name for audio cards and when we use the name of the codec as node name we =
do
not need to look further in the dts file to see what is the codec in used (=
and
what/which cpu dai we are using). All this can be seen in the main sound
support node.

>> Well, "the Moor has done his duty, the Moor can go"...
> =

> Let's ask the DT maintainers what should be the correct approach and some=
one
> should go through all the existing DT files and clean them up? People usu=
ally
> start reading the code for examples before the standard...
> =



-- =

P=E9ter
