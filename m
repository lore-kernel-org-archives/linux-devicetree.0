From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: precedence of built-in vs. platform trees?
Date: Thu, 29 Nov 2012 11:46:12 +0000
Message-ID: <CACxGe6uc-E2kHuQeKbJNDgEWLa_DLqDRzC4eRyKReeZTVdQVeA@mail.gmail.com>
References: <50B7033C.3030204@jonmasters.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <50B7033C.3030204-Zp4isUonpHBD60Wz+7aTrA@public.gmane.org>
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
To: Jon Masters <jonathan-Zp4isUonpHBD60Wz+7aTrA@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, arm-TuqUDEhatI4ANWPb/1PvSmm0pvjS0E/A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 29, 2012 at 6:39 AM, Jon Masters <jonathan-Zp4isUonpHBD60Wz+7aTrA@public.gmane.org> wrote:
> Hey guys,
>
> I apologize if I should have RTFM. If a platform provides a device tree
> at boot time, and the kernel also has a tree appended, what behavior is
> supposed to happen? i.e. what is the standard that is anticipated here?

Hmmm, nobody has asked that before. I don't think it is really defined :-)

I presume that the built-in DT will end up getting used from what I
remember about the code.

g.
