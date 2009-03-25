From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v3 1/4] NAND: FSL-UPM: add multi chip support
Date: Wed, 25 Mar 2009 11:26:54 -0600
Message-ID: <fa686aa40903251026q4a618810vcbac025f047153e7@mail.gmail.com>
References: <1237975701-23201-1-git-send-email-wg@grandegger.com>
	<1237975701-23201-2-git-send-email-wg@grandegger.com>
	<fa686aa40903250631w6a0cc8b9p3b2e3c1348e0acee@mail.gmail.com>
	<fa686aa40903250632o759921c8n1ae8d17286c1f976@mail.gmail.com>
	<49CA3503.5040006@grandegger.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <49CA3503.5040006-5Yr1BZd7O62+XT7JhA+gdA@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Wolfgang Grandegger <wg-5Yr1BZd7O62+XT7JhA+gdA@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss list <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 25, 2009 at 7:43 AM, Wolfgang Grandegger <wg-5Yr1BZd7O62+XT7JhA+gdA@public.gmane.org> wr=
ote:
> Grant Likely wrote:
>> On Wed, Mar 25, 2009 at 7:31 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org=
> wrote:
>>> On Wed, Mar 25, 2009 at 4:08 AM, Wolfgang Grandegger <wg-5Yr1BZd7O62+XT7JhA+gdA@public.gmane.org=
> wrote:
>>>> This patch adds support for multi-chip NAND devices to the FSL-UPM
>>>> driver. This requires support for multiple GPIOs for the RNB pins.
>>>> The NAND chips are selected through address lines defined by the
>>>> FDT property "chip-offset".
>>>>
>>>> Signed-off-by: Wolfgang Grandegger <wg-5Yr1BZd7O62+XT7JhA+gdA@public.gmane.org>
>>> Hi Wolfgang,
>>>
>>> Can you please send a sample device tree snippit for this and add
>>> documentation updates to your patch for the extended binding?
>>
>> Oh, and cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org in your next posting.
>
> OK, does patch 3/4 not already contain what you are looking for? See:
>
> http://ozlabs.org/pipermail/linuxppc-dev/2009-March/069787.html

Oops, sorry.  Missed that.

> I separated it from the NAND patches because they go through the MTD
> maintainer(s).
>
> BTW: did you have a chance to look into the following RFC on I2C bus
> speed setting?
>
> =A0http://ozlabs.org/pipermail/linuxppc-dev/2009-March/069489.html

No.  Looking at it now.

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
