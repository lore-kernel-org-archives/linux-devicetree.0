From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v4 08/20] fdt: Add staging area for device tree
	binding documentation
Date: Thu, 19 Jan 2012 15:52:14 -0800
Message-ID: <CAPnjgZ11huAjErvzTrao2Gy4+=FLCESFXwKSEApyBfA1kGuLLw@mail.gmail.com>
References: <1326342789-5781-1-git-send-email-sjg@chromium.org>
	<1326342789-5781-9-git-send-email-sjg@chromium.org>
	<4F1747EE.6020805@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <4F1747EE.6020805@nvidia.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Stephen Warren <swarren@nvidia.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Tom Warren <TWarren@nvidia.com>, Jerry Van Baren <vanbaren@cideas.com>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Wed, Jan 18, 2012 at 2:30 PM, Stephen Warren <swarren@nvidia.com> wrote:
> On 01/11/2012 09:32 PM, Simon Glass wrote:
>> Add a directory to hold device tree binding files, to permit easy review
>> of this material in U-Boot patches.
>>
>> Signed-off-by: Simon Glass <sjg@chromium.org>
>
>> diff --git a/doc/device-tree-bindings/README b/doc/device-tree-bindings/=
README
>
>> +The intent is not to commit these files to U-Boot, or at least only
>> +temporarily, Rather we hope that the files will be stored in another
>> +repo (shared with Linux) which is brought in as needed. Failing that,
>> +changes here will be =A0commited to the Linux
>> +Documentation/devicetree/bindings/ directory.
>
> Given there is no shared repo right now, I'd assert we should be
> specific and explicitly state that the intent /is/ to check in the
> binding documentation here, and mirror the kernel tree.
>
> But, the patch is fine to me as-is if you wish.

I'm fine with this too, it probably is more sensible if the U-Boot PTB
don't mind.

Regards,
Simon

>
> --
> nvpublic
