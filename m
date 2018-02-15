From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v9 2/3] arm: dts: add Nuvoton NPCM750 device tree
Date: Wed, 14 Feb 2018 19:59:25 -0800
Message-ID: <A86ACBBE-0825-482F-81BE-24B7CAED92CD@gmail.com>
References: <20180205235757.246758-1-brendanhiggins@google.com> <20180205235757.246758-3-brendanhiggins@google.com> <CACPK8XdXOaPZ5i=qKns3=V87nhfY62PNr4kwH9xwVYxY0djo0g@mail.gmail.com> <CACPK8XeOUrrGinU_fmnmn4atYm3Bs-xSoB2MqT0Yr-LytHt78Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACPK8XeOUrrGinU_fmnmn4atYm3Bs-xSoB2MqT0Yr-LytHt78Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Tomer Maimon <tmaimon77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Avi Fishman <avifishman70-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, julien.thierry-5wv7dgnIgG8@public.gmane.org, Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, OpenBMC Maillist <openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On February 14, 2018 6:28:51 PM PST, Joel Stanley <joel@jms=2Eid=2Eau> wrot=
e:
>On Tue, Feb 13, 2018 at 4:52 PM, Joel Stanley <joel@jms=2Eid=2Eau> wrote:
>> Hi Brendan,
>>
>> On Tue, Feb 6, 2018 at 10:27 AM, Brendan Higgins
>> <brendanhiggins@google=2Ecom> wrote:
>>> Add a common device tree for all Nuvoton NPCM750 BMCs and a board
>>> specific device tree for the NPCM750 (Poleg) evaluation board=2E
>>>
>>> Signed-off-by: Brendan Higgins <brendanhiggins@google=2Ecom>
>>> Reviewed-by: Tomer Maimon <tmaimon77@gmail=2Ecom>
>>> Reviewed-by: Avi Fishman <avifishman70@gmail=2Ecom>
>>> Reviewed-by: Joel Stanley <joel@jms=2Eid=2Eau>
>>> Reviewed-by: Rob Herring <robh@kernel=2Eorg>
>>> Tested-by: Tomer Maimon <tmaimon77@gmail=2Ecom>
>>> Tested-by: Avi Fishman <avifishman70@gmail=2Ecom>
>>
>> This looks well acked, reviewed and tested=2E How do you plan to have
>> the ARM SoC maintainers merge your patches?
>
>Following up on an IRC conversation with Brendan:
>
>The process is normally to create a git branch based on on -rc1, apply
>your patches, and send them to the ARM maintainers=2E You then push a
>signed tag to a repository somewhere, send a pull request (a git
>request-pull email, not a Github PR) and Arnd, Olof or one of the
>other maintainers will pull your tree some time before the next merge
>window opens=2E
>
>Arnd, do we have this documented somewhere for new maintainers to
>follow?

I would add a few things that we had to go through before for Broadcom SoC=
s:

- send your pull requests to arm@kernel=2Eorg and copy Arnd, Olof and Kevi=
n

- you would want to get your PGP key signed by as many people as people as=
 possible which should not be a problem if you are in an area with lots of =
kernel people like the Bay Area (which reminds me I should do that)

- if you are going to be reasonably active every cycle consider getting a =
kernel=2Eorg account to host your tree (we are still not doing that=2E=2E=
=2E)

- for future pull requests, you might want to break them into e=2Eg: DTS, =
board/Kconfig, drivers, defconfig, maintainers file, and have as little dep=
endencies between each branch to minimize merge conflicts

- build test and run test your changes against at least one other platform=
, e=2Eg: QEMU to check for multiplatform issues

In case this is of any value, there is a script here that will automatical=
ly generate pull requests emails for you based on branches matching what wa=
s mentioned above, it will also take care of CC'ing the people involved in =
the different patches:

https://github=2Ecom/ffainelli/misc-scripts/blob/master/gen-pull=2Epl

It still requires you to create an appropriate tag for the pull requests, =
though I might semi-automate that in the future, at least spawn an editor a=
nd offer some guidance, based on commit messages as to what should be in th=
e pull request email/tag=2E

HTH

--=20
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
