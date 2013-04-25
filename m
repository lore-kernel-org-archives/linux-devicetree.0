From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Call for testing: device nodes as kobjects
Date: Thu, 25 Apr 2013 22:35:24 +0100
Message-ID: <CACxGe6uiXdWSkG3E+QzV=eETyBSH1ML6iH2uQAH+J2NVYXAHBQ@mail.gmail.com>
References: <CACxGe6vPsGK1PwF6xOkkTB5LD8DqgB+Ym7daCMoPbMbVMVBQtQ@mail.gmail.com>
 <517963BB.5030308@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <517963BB.5030308-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
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
To: Nathan Fontenot <nfont-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Michal Simek <michal.simek-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 25, 2013 at 6:11 PM, Nathan Fontenot
<nfont-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org> wrote:
> Hi Grant,
>
> I finally got some time to play around with this on powerpc/pseries.
> Everything looks the same in the device tree, though I am seeing an
> issue with of_property_update(). The routine appears to work and update
> the property but when you read the file from userspace you still get
> the same content that was present before the update.
>
> The root cause appears to be that of_update_property adds the new
> property to the property list on the device node but does not update
> the binary attribute for the file created for that property.
>
> I tried to poke around a bit but couldn't get anything to work that
> would resolve the issue. I'll try to look around some more and send
> something your way if I can get it to work.

Great, thanks for the testing Nathan. I'll take a look also.

g.
